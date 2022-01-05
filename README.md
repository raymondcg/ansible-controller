# ansible-controller

This project is a basic image to run ansible plays. It's re-usable so it's assumed you have a different project with the plays, configuration, and any other details managed there.

## Build

```bash
docker build -t necrobraska/ansible-controller .
```

## Usage

* Volumes for .ssh, plays, and configuration. Replace "$ARGS" with any arguments

```bash
docker run --rm -i -v $PWD/.ssh:/root/.ssh -v $PWD/plays:/ansible/playbook -v $PWD/config:/etc/ansible --name ansible-controller necrobraska/ansible-controller $ARGS
```

* Example

```bash
docker run --rm -i -v $PWD/.ssh:/root/.ssh -v $PWD/plays:/ansible/playbook -v $PWD/config:/etc/ansible --name ansible-controller necrobraska/ansible-controller ansible-playbook helloworld.yml
```