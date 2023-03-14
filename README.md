# Whisper Tutorial
This tutorial will step through using the Whisper speech recognition model programmatically. It is intended for anyone with a computer (running Windows, Linux or Mac OS), an internet connection and curiosity.

## Prerequisites

We will run this tutorial using a Jupyter notebook, a handy tool for running Python and/or R code interactively. Data scientists use it all the time because it try new ideas without bothering to write neat top-to-bottom code that compiles every time!


I like to use Jupyterlab, which is the web-based version. Instructions for installing can be found here: [https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html)

If you want to use a more [reproducible](https://en.wikipedia.org/wiki/Reproducibility) setup, I have included a `Dockerfile` and `makefile` in this repo (this will require Docker and GNU Make to be installed on your machine). The command `make docker` will build a Docker image based on Ubuntu 20.04 with the necessary dependencies, while the command `make jupyter` will launch a container using this image, with Jupyterlab available on port `8888`.

## Next steps

Once you have Jupyter running, open `whisper_tutorial.ipynb`. Further instructions can be found there.


