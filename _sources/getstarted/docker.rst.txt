.. _sec:docker:

Use SPEX through Docker
-----------------------

  .. highlight:: none

SPEX is written mostly in Fortran 90 and depends on a few system libraries. This makes it difficult to provide a few
binary versions that will continue to run on multiple platforms over many years. Therefore, we have also created a
Docker image for SPEX that can be run on the Docker platform, which is available for Linux, Mac OS and Windows.

Step 1: Download and install Docker on your computer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To run a Docker image, please install Docker on your computer. See the `Docker website <https://www.docker.com/>`_
for details and look for the Docker Engine community edition. Once you have downloaded and installed Docker, you can
continue with this tutorial.

Step 2: Download the SPEX docker image from Zenodo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The SPEX Docker image is available on `this Zenodo page <https://doi.org/10.5281/zenodo.1924563>`_ as a tar.gz file.
Please download the file called spex-[version]-Docker.tar.gz, for example::

    spex-3.08.01-Docker.tar.gz

Or, alternatively, you can pull the image from Docker hub with the command: ``docker pull spexxray/spex:latest``.

Step 3: Import the SPEX image into Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before you can run the docker file, it should be imported into the docker system. This can be done on the command line::

    user@linux:~> docker load -i spex-3.08.01-docker.tar.gz

The image will be named spexxray/spex with the tag 3.08.01 and can be found with the command::

    user@linux:~> docker images
    REPOSITORY TAG IMAGE ID CREATED SIZE
    spexxray/spex 3.08.01 0a0a0a0a0a0 1 minute ago 996MB

Step 4: Run SPEX on Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^

Using the docker run command, the image can be executed and SPEX can be run in a so-called container. To enjoy all the
capabilities of SPEX, two things need to be arranged in the docker run command: access to local directories and a graphical
X11 connection. To arrange this, additional flags need to be specified on the command line.

Mounting local directories to the container
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you would like to mount your own home directory into the SPEX container such that you can use some spo and res files there
or save the output files, then you need the following flags::

    -e LOCAL_USER_ID=`id -u $USER`
    -v /home/myusername:/home/user

The first flag arranges that the user in the container will have the same user ID as you. This will allow you to read and
write to your home directory from within the container.

The second flag arranges that your true local home directory called /home/myusername is mounted to /home/user inside the SPEX container.

MAC users: Please note that on OSX your home directory is in /Users/myusername.

Arranging the X11 connection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To make sure PGPLOT can connect to the X11 server on the host, we need to make a few connections from the container to the host machine.
This is done with the following flags::

    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

The first flag sets the DISPLAY variable inside the container to the DISPLAY variable of the host machine. The second flag mounts the X11
temporary directory of the host to the same directory inside the container.

MAC users: To use X11 on Mac, you need to install XQuartz (or a similar X11 server) and set it to 'Allow connections from network clients'
in the XQuartz settings. In addition, the X server should be set to allow incoming connections from localhost on the command line::

    user@macos:~> xhost +127.0.0.1

Then the DISPLAY variable on the docker run line should be set to host.docker.internal:0

The complete docker run command
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The full run commands for docker now look like below, where -w means that the container will start in working directory /home/user.

For Linux::

    docker run -it \
    -e DISPLAY=$DISPLAY \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/myusername:/home/user \
    -w /home/user \
    spexxray/spex:3.08.01

For Mac::

    docker run -it \
    -e DISPLAY=host.docker.internal:0 \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /Users/myusername:/home/user \
    -w /home/user \
    spexxray/spex:3.08.01

The docker run command above will provide you with a prompt that will allow you to run spex::

    user@linux:~> docker run -it -e DISPLAY=$DISPLAY -e LOCAL_USER_ID=`id -u $USER` \
    -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/myusername:/home/user -w /home/user \
    spexxray/spex:3.08.01

    Welcome to the SPEX Docker Container!
    Just type 'spex' to start the program.
    user@0922f2e4ff85:~>

In this environment, you can just run spex or trafo::

    user@0922f2e4ff85:~> spex
     Welcome user to SPEX version 3.08.01

     NEW in this version of SPEX:
    29-03-2024 Added plot ion command and linid program for line identification
    27-05-2024 Fixed issue with trafo converting large XRISM matrix
    15-07-2024 Multiple bugfixes for response binning, tpho, and pyspex
    15-07-2024 Neutral nitrogen N I oscilator strength correction based on Garcia+09

    Currently using SPEXACT version 2.07.00. Type `help var calc` for details.

    SPEX>
