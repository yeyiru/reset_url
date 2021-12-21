import http.server as SimpleHTTPServer
import socketserver
import pandas as pd

class myHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def get_heading(self, pano_id, h_id):
        df = pd.read_csv('./2021_04_21_full.csv')
        row = df[df['pano_id'] == pano_id]
        heading = str(row[f'HEADING{h_id}'].iloc[0])
        return heading

    def do_GET(self):
        print(self.path)
        pano_id, h_id = self.path[1:].split('$')[:2]
        heading = self.get_heading(pano_id, h_id)
        self.send_response(301)
        new_path = f'https://api.sgis.tw/streetview/v1/image?size=640x640&pano={pano_id}&fov=90&heading={heading}&pitch=0&format=png&filename=/{self.path[1:]}'
        self.send_header('Location', new_path)
        self.end_headers()

PORT = 8501
handler = socketserver.TCPServer(("", PORT), myHandler)
print(f"serving at port {PORT}")
handler.serve_forever()