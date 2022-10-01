#!/usr/bin/env bash
set -e

# For external XServers
export DISPLAY=host.docker.internal:0.0
export LIBGL_ALWAYS_INDIRECT=0

source "/opt/ros/foxy/setup.bash" --

/usr/sbin/sshd -D &  # TODO run if the process doesnt exist

exec "$@"
