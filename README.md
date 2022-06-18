# Section 8-9

## Section 8: Building a Multi-Container Application

### Overview  

In Section 8, Stephen Grider steps through setting up a Fibonnaci calculator that will run in multiple containers.  The application is overly complicated for what it does, but it illustrates simply how an application can be designed so that different components can be each run in its own container.

**Important Notes**

On Linux the Dockerfile cannot be setup as shown in the videos because the node:alpine image cannot be run using the root user.  Instead it has to be run as the node user inside a working directory of /home/node/app.  The user has to be set in the Dockerfile, the working directory has to be created and set, and the chown option has to be set when copying files.

## Section 9: "Dockerizing" Multiple Services

### Overview

In this section, Stephen Grider shows how to dockerize the client, server, and worker processes in their own containers.