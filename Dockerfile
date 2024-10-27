# Use the official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Set the FLASK_APP environment variable
ENV FLASK_APP=hello.py 

# Expose the app's port
EXPOSE 5000

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
