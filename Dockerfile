# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install curl
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 8000 for the application
EXPOSE 8000

# Define environment variable
ENV NAME fibonacci-app

# Run main.py when the container launches
CMD ["python", "./main.py"]
