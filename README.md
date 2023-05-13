# LMQL Docker Image
This repository contains a minimal Dockerfile to run [LMQL](https://github.com/eth-sri/lmql)'s playground. Note that currently [LMQL](https://github.com/eth-sri/lmql) playground runs on port `3000`.

## Building the image
The following command lets you create an image with this Dockerfile:
```
docker build -t lmql-docker:latest .
```
### Using GPU and local models
In order to use the local models, you first need to ensure that you have CUDA installed on your host machine and a supported Nvidia GPU. 
Be aware that this image has been tested with `CUDA 12.1` on the host machine and will install PyTorch stable with `CUDA 11.8` support. Before that, make sure 
that you have install docker gpu support. Then, finally, build the image using the following line:
```
docker build --build-arg GPU_ENABLED=true -t lmql-docker:cuda11.8 .
```
Note that the `cuda11.8` tag is indicative and can be changed as you like.
## Starting a container
To start a container using the image that you have built:
```
docker run -d -p 3000:3000 lmql-docker:latest
```
### Using environment variables
To override the default environment variables, you can do it through the docker run command like this example:
```
docker run -d -e OPENAI_API_KEY=<your openai api key> -p 3000:3000 lmql-docker:latest
```
Otherwise, if you want to use the `api.env` file you can also mount the file as follow:
```
docker run -d -v $(PWD)/api.env:/lmql/.lmql/api.env -p 3000:3000 lmql-docker:latest
```
### Starting a container with GPU and local models
Make sure you have followed the image building step from the section `Using GPU and local models`. 
To start the docker container with access to the GPUs consider using the following command:
```
docker run --gpus all -d -p 3000:3000 lmql-docker:cuda11.8
```
Where `all` means that you allocate all the GPUs to the docker container.

Note that here we expose the port `3000` from the container to the port `3000` from your machine. And we reuse the name `lmql-docker:cuda11.8`
as it is the value we previously used to build the image.