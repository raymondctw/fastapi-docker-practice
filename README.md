# FastAPI with Docker

This is the first Docker practice project. In this project, I will create a basic framework of FastAPI as docker image.

### Project strucutre
```
.
├── Dockerfile
├── LICENSE
├── README.md
├── app
│   └── main.py
└── requirements.txt
```

## Step 1: Define the Python packages we need in this project
`requirements.txt`
```
fastapi
uvicorn
```



## Step 2: Create a FastAPI basic project

```python
# ./app/main.py`
from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=80)
```


## Step 3: Create Dockerfile

```dockerfile
# ./Dockerfile
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
```

## Step 4: Build docker images and run container
### a. Build docker image
Create a new docker image `docker-practice-1` with the root directory Dockerfile.
> docker build -t docker-practice-1 .

### b. Run docker container
Run the container `fastapi-test1` with the docker image `docker-practice-1`, and setting the container port 80 point to computer port 80.
> docekr run --name fastapi-test1 -p 80:80 docker-practice-1

---
## Finally...
You can open your browser and enter [http://127.0.0.1/](http:127.0.0.1/) or your IP address. You may see the page show:
```json
{"Hello":"World"}
```
