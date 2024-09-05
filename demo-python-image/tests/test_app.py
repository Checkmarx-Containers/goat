import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

# Vulnerable test: Doesn't properly sanitize input
def test_greet(client):
    response = client.get('/greet?name=<script>alert(1)</script>')
    assert b"<script>alert(1)</script>" in response.data

# No validation of system commands
def test_run_command(client):
    response = client.post('/run', data={'command': 'echo Hello'})
    assert b"Hello" in response.data
