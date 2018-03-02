# docker-git-pull

Pulls down a Github repository, and runs the makefile and launches

## Why did you do this?

When I release something, I want to test and make sure it works on a fresh system.

This Image will pull down an image from a github repository specified in the
enviroment, and runs the make file to install prerequisites, build and run.

This is how I use it:

`docker run -it -p 3000:3000 -e github='https://github.com/pmcdowell-okta/hackey-golang-build.git' oktaadmin/gitpull`

## This is built for GOLANG, but just install any language you wish
