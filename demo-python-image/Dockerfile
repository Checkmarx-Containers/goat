############################
# First stage: Build stage #
############################

# Large size image with more tools (Debian), includes gcc, make, libssl for complex building and testing (~900MB)
FROM python:3.7-stretch AS build-stage

# Copy application and test files
COPY ./app.py /app/app.py
COPY ./tests /app/tests

# Install necessary Python dependencies for testing (outdated versions)
RUN pip install --no-cache-dir \
    flask==1.1.2 \
    requests==2.22.0 \
    jinja2==2.11.3 \
    markupsafe==1.1.1 \
    itsdangerous==1.1.0 \
    werkzeug==1.0.1 \
    pytest==3.1.1

# Run tests (pytest will automatically find tests in the 'tests' folder)
WORKDIR /app
RUN pytest tests

###########
# RUNTIME #
###########

# Light weight image (Alpine ~50MB), more secure image
FROM python:3.8-slim AS runtime-stage

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Insecure environment variable (hardcoded secret)
ENV SECRET_KEY="hardcoded_insecure_key"

# Copy only the application code from the build stage (no test files)
COPY ./app.py /app/app.py

# Install runtime dependencies
RUN pip install --no-cache-dir \
    flask==1.1.2 \
    requests==2.22.0 \
    jinja2==2.11.3 \
    markupsafe==1.1.1 \
    itsdangerous==1.1.0 \
    werkzeug==1.0.1

# Run as root (insecure)
USER root

# Expose port (insecure)
EXPOSE 5000

# Run the application
WORKDIR /app
CMD ["python", "app.py"]