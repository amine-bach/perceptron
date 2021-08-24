FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get -q update && \
    sudo apt-get install -yq gdb build-essential python3-dev python3-venv cmake libeigen3-dev