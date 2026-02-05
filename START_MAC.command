#!/bin/bash
cd "$(dirname "$0")"

echo "Starting local server..."
echo "Open this in Chrome: http://127.0.0.1:8000"
echo ""

chmod +x ./caddy-mac 2>/dev/null
./caddy-mac file-server --listen :8000 --root .

echo ""
echo "Server stopped. Press Enter to close."
read
