#!/bin/sh

cp -R /tmp/.ssh /root/.ssh
chmod 644 /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa
chmod 700 /root/.ssh

exec "$@"