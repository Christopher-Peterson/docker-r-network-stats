# Docker image for Kolaczyk and Csárdi's *Statistical Analysis of Network Data with R*

This builds a docker file with RStudio and all of the required packages needed for the code supplement to *Statistical Analysis of Network Data for R, Second Edition*, by Eric D. Kolaczyk, and Gábor Csárdi.  The repository contains the dockerfile, while the image is hosted on Docker Hub as `crpeters/r-network:4.1.1`. 

The image also contains the tidyverse, a variety of geospatial packages, the Intel MKL library, and a few other useful R packages.

## Installation

1. **Install Docker.** Instructions for [Windows](https://docs.docker.com/desktop/windows/), [Mac](https://docs.docker.com/desktop/mac/), and [Ubuntu](https://docs.docker.com/engine/install/ubuntu/). More information [here](https://containers-at-tacc.readthedocs.io/en/latest/containers/02.dockerbasics.html).

2. **Pull the Network Stats Docker image.** In the terminal, run `sudo docker pull crpeters/r-network:4.1.1`
3. **Create a working directory on your local machine.** You don't need to put anything in it yet.
4. **Initialize the image:** Run the following code, adjusting `LOCAL_DIR` and `PASSWORD` if so desired
```bash
# Change LOCAL_DIR to your local working directory
LOCAL_DIR=~/Documents/Files/Grad_School/Network_Stats
# Change password if you want this to be more secure
PASSWORD=1234
  
IMAGE=crpeters/r-network:4.1.1
NAME=r-network-stats
PORT=8787
# Run the container
sudo docker run -d -p $PORT:$PORT \
  -v $LOCAL_DIR:/home/rstudio/Network_Stats \
  -e PASSWORD=$PASSWORD -e USERID=$UID --name $NAME $IMAGE
```

## Use

1. In the console, run `sudo docker container start r-network-stats` (You can skip this if you just initialized the container for the first time).
2. In a web browser, go to `localhost:8787`
3. Sign in with the username `rstudio` and the password you used above
4. Welcome to RStudio

When you're done, run `sudo docker container stop r-network-stats` to shut it down.

## Building the docker image

If you'd like to build the image yourself, you'll need to make a docker account ([info here](https://containers-at-tacc.readthedocs.io/en/latest/containers/02.dockerbasics.html)).  Download `r-network.dockerfile`, then run

```bash

IMAGE_NAME=r-network
IMAGE_TAG=4.1.1
DOCKER_FILE=r-network.dockerfile
# Change this to your docker username
DOCKER_USERNAME=crpeters

sudo docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG -f $DOCKER_FILE .
sudo docker push  $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG
```

