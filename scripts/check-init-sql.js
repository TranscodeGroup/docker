#!/usr/bin/env node
/**
 * 校验 mysql8/initdb 下所有初始化 SQL 的 INSERT VALUES 数量是否与对应 CREATE TABLE 的列数一致。
 * 用法：node scripts/check-init-sql.js
 */

const fs = require("fs");
const path = require("path");

const base = "mysql8/initdb";
const files = fs.readdirSync(base).filter(f => f.endsWith(".sql")).sort().map(f => path.join(base, f));

// schema.table -> column count
const tables = {};
const inserts = [];

function norm(name) {
  return name.replace(/`/g, "").toLowerCase();
}

function getDb(line, currentDb) {
  const m = line.match(/^USE\s+`?(\w+)`?\s*;/i);
  return m ? norm(m[1]) : currentDb;
}

// Split body by top-level commas (not inside parentheses or quotes)
function splitTopLevel(text) {
  const parts = [];
  let current = "";
  let depth = 0;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    if (ch === "'") {
      current += ch;
      i++;
      while (i < text.length && text[i] !== "'") {
        if (text[i] === "\\" && i + 1 < text.length) {
          current += text[i++];
        }
        current += text[i++];
      }
      if (i < text.length) current += text[i];
    } else if (ch === "(") {
      depth++;
      current += ch;
    } else if (ch === ")") {
      depth--;
      current += ch;
    } else if (ch === "," && depth === 0) {
      parts.push(current.trim());
      current = "";
    } else {
      current += ch;
    }
  }
  if (current.trim()) parts.push(current.trim());
  return parts;
}

function defaultDb(file) {
  const baseName = path.basename(file);
  if (baseName.includes("maintain")) return "maintain";
  if (baseName.includes("cbus")) return "cbus";
  if (baseName.includes("gps")) return "gps";
  if (baseName.includes("analytics")) return "analytics";
  return null;
}

files.forEach(file => {
  const text = fs.readFileSync(file, "utf-8");
  const lines = text.split(/\r?\n/);

  let currentDb = defaultDb(file);

  // Parse CREATE TABLE
  const createRe = /CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?([\w`.]+)\s*\((.*?)\)\s+ENGINE/sgi;
  let m;
  while ((m = createRe.exec(text)) !== null) {
    const tableName = norm(m[1]);
    const schema = tableName.includes(".") ? tableName.split(".")[0] : currentDb;
    const shortName = tableName.includes(".") ? tableName.split(".")[1] : tableName;
    const key = schema ? `${schema}.${shortName}` : shortName;
    const body = m[2];
    const parts = splitTopLevel(body);
    let colCount = 0;
    for (const s of parts) {
      if (!s) continue;
      if (/^(PRIMARY\s+KEY|UNIQUE\s+KEY|UNIQUE\s+INDEX|KEY|INDEX|CONSTRAINT|FOREIGN\s+KEY)\b/i.test(s)) continue;
      if (/^`\w+`\s+\w+/.test(s)) {
        colCount++;
      }
    }
    tables[key] = colCount;
  }

  // Parse INSERT INTO (only without explicit column list)
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    currentDb = getDb(line, currentDb);

    const match = line.match(/^INSERT\s+INTO\s+([\w`.]+)\s+VALUES\s+(.*)/i);
    if (!match) continue;
    const tableName = norm(match[1]);
    const schema = tableName.includes(".") ? tableName.split(".")[0] : currentDb;
    const shortName = tableName.includes(".") ? tableName.split(".")[1] : tableName;
    const key = schema ? `${schema}.${shortName}` : shortName;

    let rest = match[2];
    let j = i;
    while (!rest.trim().endsWith(";") && j + 1 < lines.length) {
      j++;
      rest += " " + lines[j];
      currentDb = getDb(lines[j], currentDb);
    }
    rest = rest.trim().replace(/;$/, "");

    // Extract top-level parentheses groups
    const groups = [];
    let start = -1;
    let depth = 0;
    for (let k = 0; k < rest.length; k++) {
      const ch = rest[k];
      if (ch === "'") {
        k++;
        while (k < rest.length && rest[k] !== "'") {
          if (rest[k] === "\\" && k + 1 < rest.length) k++;
          k++;
        }
      } else if (ch === "(") {
        if (depth === 0) start = k;
        depth++;
      } else if (ch === ")") {
        depth--;
        if (depth === 0 && start !== -1) {
          groups.push(rest.slice(start + 1, k));
          start = -1;
        }
      }
    }

    for (const values of groups) {
      let count = 1;
      depth = 0;
      for (let k = 0; k < values.length; k++) {
        const ch = values[k];
        if (ch === "'") {
          k++;
          while (k < values.length && values[k] !== "'") {
            if (values[k] === "\\" && k + 1 < values.length) k++;
            k++;
          }
        } else if (ch === "(") {
          depth++;
        } else if (ch === ")") {
          depth--;
        } else if (ch === "," && depth === 0) {
          count++;
        }
      }
      inserts.push({file, line: j + 1, table: key, vcount: count});
    }
  }
});

const mismatches = inserts.filter(ins => tables[ins.table] && tables[ins.table] !== ins.vcount);
const grouped = {};
mismatches.forEach(ins => {
  const key = `${ins.file}:${ins.line}:${ins.table}`;
  if (!grouped[key]) grouped[key] = ins;
});

if (Object.keys(grouped).length) {
  console.log("发现列数不匹配的 INSERT:");
  Object.values(grouped).sort((a,b)=>`${a.file}:${a.line}`.localeCompare(`${b.file}:${b.line}`)).forEach(ins => {
    console.log(`  ${ins.file}:${ins.line} 表=${ins.table} 列数=${tables[ins.table]} VALUES数=${ins.vcount}`);
  });
} else {
  console.log("未发现列数不匹配的 INSERT。");
}

const insertedTables = new Set(inserts.map(i => i.table));
const unknown = [...insertedTables].filter(t => !tables[t]);
if (unknown.length) {
  console.log("\n以下 INSERT 找不到对应 CREATE TABLE（可能跨库/表名解析问题）:");
  unknown.sort().forEach(t => console.log(`  ${t}`));
}
