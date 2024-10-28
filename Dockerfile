# Use the official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY src/ .

# Set the FLASK_APP environment variable
ENV FLASK_APP=hello.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the app's port
EXPOSE 5000

# Run the application with 'flask run'
CMD ["flask", "run"] 