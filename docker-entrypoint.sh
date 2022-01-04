#!/bin/sh

echo "root"
ls /root/.ssh
echo "tmp"
ls /tmp/.ssh
cp -R /tmp/.ssh /root/.ssh
chmod 700 -R /root/.ssh
chmod 644 /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa

exec "$@"