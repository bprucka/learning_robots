# Atari Learning

For this evaluation I use the docker container from:

[Docker-rl gym](https://github.com/jaimeps/docker-rl-gym)

The file contains info on how to pull down the docker image:
docker pull jaimeps/rl-gym

To run locally, I use:
docker run -p 8888:8888 -v ~/learning_robots/rl/:/ds jaimeps/rl-gym
