#!/bin/sh
set -e

# Apply pending Prisma migrations (safe: never drops data, only runs new migrations)
if [ "${SKIP_MIGRATIONS:-false}" != "true" ]; then
  echo "Running prisma migrate deploy..."
  npx prisma migrate deploy
fi

exec node src/app.js
