#!/usr/bin/env python3
"""
Simple HTTP Server for Project Timeline Dashboard

This script starts a local web server to properly serve the HTML and JSON files.
This is needed because browsers block loading local JSON files due to CORS policy.

Usage:
    python3 run_server.py

Then open your browser to: http://localhost:8000
"""

import http.server
import socketserver
import webbrowser
import os
from pathlib import Path

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Add CORS headers to allow local file access
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET')
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate')
        super().end_headers()

def main():
    # Change to the script's directory
    script_dir = Path(__file__).parent.absolute()
    os.chdir(script_dir)
    
    print("=" * 60)
    print("🚀 Project Timeline Dashboard Server")
    print("=" * 60)
    print(f"\n📁 Serving files from: {script_dir}")
    print(f"🌐 Server running at: http://localhost:{PORT}")
    print(f"\n📊 Open in browser: http://localhost:{PORT}/project-timeline-interactive.html")
    print("\n💡 Press Ctrl+C to stop the server")
    print("=" * 60)
    
    # Try to open browser automatically
    try:
        webbrowser.open(f'http://localhost:{PORT}/project-timeline-interactive.html')
        print("\n✅ Browser opened automatically")
    except:
        print("\n⚠️  Please open the URL manually in your browser")
    
    # Start server
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n👋 Server stopped. Goodbye!")

if __name__ == "__main__":
    main()
