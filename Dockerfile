# Dockerfile

# Stage 1: Use an official Python runtime as a parent image.
# Using a specific version is a best practice. 'slim' is smaller than the default.
FROM python:3.11-slim

# Set the working directory inside the container.
# All subsequent commands (COPY, RUN, CMD) will be executed from this path.
WORKDIR /app

# Copy the dependencies file first.
# This takes advantage of Docker's layer caching. The 'pip install' step will
# only be re-run if requirements.txt changes, speeding up subsequent builds.
COPY requirements.txt .

# Install the dependencies.
# --no-cache-dir reduces the image size.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the working directory.
COPY . .

# Expose the port that the application will run on.
# This is documentation; it doesn't actually open the port.
EXPOSE 5000

# Define the command to run the application.
# Use gunicorn for a production-ready server, not Flask's built-in dev server.
# '0.0.0.0' is crucial to allow traffic from outside the container.
# 'app:app' means: in the file 'app.py', find the Flask instance named 'app'.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]