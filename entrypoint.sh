#!/bin/sh

PORT=${PORT:-8090}

echo "Running on port $PORT"

if [ ! -f /pb_data/data.db ]; then
  echo "First run detected. Creating superuser..."
  /pb/pocketbase superuser upsert $ADMIN_EMAIL $ADMIN_PASSWORD
fi

exec /pb/pocketbase serve --http=0.0.0.0:$PORT
