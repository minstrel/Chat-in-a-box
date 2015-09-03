rm -rf /usr/src/app/public/uploads/post/picture/*
sqlite3 /usr/src/app/db/production.sqlite3 < /usr/src/app/daily_clean.sql
