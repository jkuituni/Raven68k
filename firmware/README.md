# How to compile
### The short, short version

 1. Get `docker`. Actually, get `nerdctl` or `podman` instead if you know what you are doing.
 2. Pull the compiler container

> docker pull mrszb/m68kcross:11.2

3. From this directory, start the container and mount this directory as `/src`

> docker run --rm -it -v ${PWD}:/src mrszb/m68kcross:11.2 bash

The source is now mounted to the `/src` folder.  To compile:

> cd /src
> make clean
> make



