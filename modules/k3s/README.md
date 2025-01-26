# k3s

molecule to setup k3s servers

## setup

The host running terraform should be able to reach the servers via ssh with the `root` user.

```
$ ssh -T root@<HOSTNAME-OR-IP> echo works
# should print works without asking password
```

This can be done by copying the public ssh key-pair you'll be using for ssh into the `~/.ssh/authorized_keys` file on the server.

To avoid both 1. the need to provide a password and 2. using passwordless ssh keys, see the ansible playbooks in ../../ansible. There you will find instructions for configuring a passwordless agent

The below demonstrates a method for creating a docker image that can be ssh'ed into in this way.

docker image build --no-cache -t build-context -f - . <<EOF
FROM python:3.9
WORKDIR /build-context

CMD find .

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

# See: https://docs.github.com/en/authentication/keeping-your-account-and-data->
COPY ./known_hosts  /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

# Avoid cache purge by adding requirements first
ADD ./requirements.txt /code/requirements.txt
RUN rm -rf /root/.ssh/
