FROM python:3.12-slim

# Define the working directory inside the container
WORKDIR /code

# Copy the requirements file from root directory to the container's working directory
COPY ./requirements.txt /code

# Install the Python packages from the requirements file
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the rest of the files from root directory to the container's working directory
COPY ./app /code/app

# Define the command to run the application
CMD ["python", "app/main.py"]




