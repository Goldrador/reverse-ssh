#!/bin/sh

if [ ! -f /config/key ]; then
    echo "SSH private key not found. Please mount your SSH key."
    exit 1
fi

chmod 600 /config/key

ssh -i /config/key -N -R ${REMOTE_PORT}:localhost:${LOCAL_PORT} ${REMOTE_USER}@${REMOTE_HOST} -p ${REMOTE_SSH_PORT}
