FROM alpine:3.21

RUN set -x && \
	echo "==> Upgrading apk and system..."  && \
    apk update && apk upgrade && \
    \
	echo "==> Installing Ansible..."  && \
	apk add --no-cache ansible sshpass openssh && \
	\
    echo "==> Cleaning up..."  && \
	rm -rf /tmp/* && \
	rm -rf /var/cache/apk/* \
    \
    echo "==> Adding hosts for convenience..."  && \
	mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

ENV ANSIBLE_GATHERING=smart
ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV ANSIBLE_RETRY_FILES_ENABLED=false
ENV ANSIBLE_ROLES_PATH=/ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING=True
ENV PYTHONPATH=/ansible/lib
ENV PATH=/ansible/bin:$PATH
ENV ANSIBLE_LIBRARY=/ansible/library

WORKDIR /ansible/playbook

COPY docker-entrypoint.sh /ansible/playbook/docker-entrypoint.sh
RUN chmod +x /ansible/playbook/docker-entrypoint.sh
ENTRYPOINT ["/ansible/playbook/docker-entrypoint.sh"]

CMD ["ansible-playbook","--version"]
