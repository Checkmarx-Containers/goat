# The Python application runs a Flask server that exposes endpoints (/run and /greet) with vulnerabilities like command injection and potential XSS.
# The application also runs a continuous loop (run_vulnerable_loop) every 5 seconds using the vulnerable requests library to fetch data from https://jsonplaceholder.typicode.com/todos/1
# This simulates the use of an insecure 3rd-party package.
# The loop will keep running while the Flask app is available on port 5000, so you can access it while it performs the HTTP request in the background.

import time
import requests
import os
import logging
from flask import Flask, request

app = Flask(__name__)

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Vulnerability: Hardcoded secret key
app.config['SECRET_KEY'] = 'hardcodedsecretkey'

# Vulnerability: Command injection example
@app.route('/run', methods=['POST'])
def run_command():
    command = request.form['command']
    result = os.popen(command).read()  # Vulnerability: Unsanitized input used in system command
    return f"Command output: {result}"

# Vulnerability: Insecure use of user input
@app.route('/greet', methods=['GET'])
def greet():
    name = request.args.get('name')
    return f"Hello, {name}!"  # Vulnerability: Potential XSS

# Vulnerable action: Making HTTP request with an outdated version of the 'requests' library
def vulnerable_http_request():
    url = "https://jsonplaceholder.typicode.com/todos/1"  # Vulnerability: No SSL, outdated 'requests' library
    try:
        response = requests.get(url)
        if response.status_code == 200:
            logging.info(f"Successfully fetched data from {url}")
        else:
            logging.warning(f"Failed to fetch data. Status code: {response.status_code}")
    except Exception as e:
        logging.error(f"Error occurred while fetching data: {e}")

# Infinite loop running every 5 seconds
def run_vulnerable_loop():
    while True:
        vulnerable_http_request()
        time.sleep(5)

if __name__ == "__main__":
    # Start the loop in a separate thread to avoid blocking the Flask server
    from threading import Thread
    logging.info("Starting the vulnerable loop in the background...")
    loop_thread = Thread(target=run_vulnerable_loop)
    loop_thread.daemon = True
    loop_thread.start()
    
    # Start the Flask server
    logging.info("Starting Flask server...")
    app.run(host='0.0.0.0', port=5000)