# app.py

from flask import Flask, jsonify

# Create a Flask application instance
app = Flask(__name__)

# Define a route for the root URL ("/")
@app.route("/")
def hello_world():
    """
    A simple endpoint that returns a welcome message.
    """
    # jsonify is a Flask helper that converts a Python dict to a JSON response
    return jsonify(message="Hello, World! Welcome to Project Genesis.")

# Define a health check endpoint
@app.route("/health")
def health_check():
    """
    A simple health check endpoint to confirm the service is running.
    """
    return jsonify(status="ok"), 200

# This block allows you to run the app directly with `python app.py` for local testing
if __name__ == '__main__':
    # host='0.0.0.0' makes the app accessible from your network, not just localhost
    # This is important for running inside a Docker container
    app.run(host='0.0.0.0', port=5000)