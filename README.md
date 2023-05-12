# LMQL Docker Image
This repository contains a minimal Dockerfile to run [LMQL](https://github.com/eth-sri/lmql)'s playground. Note that currently [LMQL](https://github.com/eth-sri/lmql) playground runs on port **3000**.

## Building the image
The following command lets you create an image with this Dockerfile:
```
docker build -t lmql-docker:latest .
```
## Starting a container
To start a container using the image that you have built:
```
docker run -d -p 3000:3000 lmql-docker:latest
```

Note that here we expose the port **3000** from the container to the port **3000** from your machine. And we reuse the name **lmql-docker:latest**
as it is the value we previously used to build the image.