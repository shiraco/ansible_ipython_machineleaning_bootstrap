ansible_ipython_machinelearning_bootstrap
====

## Overview

Setup machinelearning development environment with ipython on ubuntu(ec2)

## Environment

* target server
  * OS: Ubuntu 14.04
  * Instance type: t2.micro

## Installation

See http://docs.ansible.com/intro_installation.html

## Usage

### SSH setting on local client

1. edit ~/.ssh/config to ssh target server

```
$ vim ~/.ssh/config
```

```text:~/.ssh/config
Host ec2_bootstrap
  HostName ec2-XXX-XXX-XXX-XXX.ap-northeast-1.compute.amazonaws.com
  User ubuntu
  IdentityFile ~/.ssh/hoge.pem
```

### Run playbook from local client

1. run playbook on local client

```
$ cd ansible/
$ ansible-playbook site.yml
```

### Run ipython notebook server on target server(EC2)

1. ssh to target server(EC2)
2. apply virtualenv venv
3. run server

```
$ ssh ec2_bootstrap

ubuntu@ip-xxx-xxx-xxx-xxx:~$ . venv/bin/activate
(venv)ubuntu@ip-xxx-xxx-xxx-xxx:~$ ipython notebook --profile=nbserver
```

Open browser and access `http://ec2-XXX-XXX-XXX-XXX.ap-northeast-1.compute.amazonaws.com:8888/` .
## Running results

Running result summary
Using Ansible plugin [ansible-profile](https://github.com/jlafon/ansible-profile)

```
PLAY RECAP ********************************************************************
create virtualenv 'venv' and pip install scipy in 'venv' -------------- 778.51s
pip install python ml libraries in 'venv' ----------------------------- 608.72s
install pyenv's python and rehash ------------------------------------- 163.49s
apt-get upgrade a server ----------------------------------------------- 68.82s
info ------------------------------------------------------------------- 55.26s
apt-get install basic pkg ---------------------------------------------- 48.94s
apt-get install pkg for python ml libraries ---------------------------- 23.83s
create swapfile for installing scipy ----------------------------------- 22.24s
pip install global python pkgs ----------------------------------------- 15.05s
apt-get updates a server ----------------------------------------------- 12.98s
ec2_bootstrap               : ok=24   changed=17   unreachable=0    failed=0
```

## References

* http://docs.ansible.com/
* https://github.com/jlafon/ansible-profile
* http://supportex.net/blog/2014/10/ansible-installing-pyenv-centos/
* http://qiita.com/FGtatsuro/items/2366c93131c47aef8dfe

## Lisence

This software is released under the MIT License, see LICENSE.
