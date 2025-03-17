#!/bin/bash
set -e

# 执行SQL命令来创建扩展
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS vector;
    
    -- 创建示例表
    CREATE TABLE IF NOT EXISTS documents (
        id SERIAL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        embedding vector(1536)
    );
    
    -- 创建一个简单的相似度搜索函数
    CREATE OR REPLACE FUNCTION match_documents(query_embedding vector(1536), match_threshold float, match_count int)
    RETURNS TABLE(id bigint, title text, content text, similarity float)
    LANGUAGE SQL
    AS \$\$
        SELECT id, title, content, 1 - (embedding <=> query_embedding) AS similarity
        FROM documents
        WHERE 1 - (embedding <=> query_embedding) > match_threshold
        ORDER BY similarity DESC
        LIMIT match_count;
    \$\$;
EOSQL