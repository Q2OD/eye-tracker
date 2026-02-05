from flask import Flask, render_template, send_from_directory

app = Flask(__name__)

@app.route('/')
def index():
    # Renders the 'index.html' file from the 'templates' folder
    return render_template('index.html')

@app.route("/mediapipe/<path:filename>")
def mediapipe_files(filename):
    return send_from_directory("static/mediapipe", filename)
if __name__ == '__main__':
    # Runs the app in debug mode, accessible at http://127.0.0.1
    app.run(debug=True, port=8924, host="0.0.0.0")
