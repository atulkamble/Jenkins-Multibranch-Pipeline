# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
#install pytest
RUN pip install pytest

# Copy the rest of the application code into the container
COPY . .

# Run the application
CMD ["python", "app.py"]
