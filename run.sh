#!/bin/bash
cd "$(dirname "$0")/web"
python3 - <<'EOF'
import http.server, socket, webbrowser

def find_free_port(start=8801):
    for port in range(start, 65535):
        with socket.socket() as s:
            try:
                s.bind(("", port))
                return port
            except OSError:
                continue

port = find_free_port()
print(f"Serving at http://localhost:{port}")
webbrowser.open(f"http://localhost:{port}")
http.server.test(HandlerClass=http.server.SimpleHTTPRequestHandler, port=port, bind="0.0.0.0")
EOF
