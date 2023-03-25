# OS Provisioning

![Task: ^3.8](https://img.shields.io/badge/Task-3.8-29BEB0?style=for-the-badge&logo=Task&logoColor=white)
![Python: ^3.10](https://img.shields.io/badge/Python-3.10-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white)
![Poetry: ^1.4](https://img.shields.io/badge/Poetry-1.4-60A5FA?style=for-the-badge&logo=Poetry&logoColor=white)
![ansible-core: ^2.12](https://img.shields.io/badge/Ansible%20Core-2.12-EE0000?style=for-the-badge&logo=Ansible&logoColor=white)

This repository contains a set of scripts and ansible playbooks to provision the following operating systems:

- Ubuntu >= 20.04
- Fedora >= 35
- Rocky Linux >= 8.4
- MacOS >= 11.5

## Requirements

This repository uses `task` to manage the provisioning process.
Please follow the [installation instructions](https://taskfile.dev/installation/) to install task.

Also, you need to have `poetry` installed to install the python dependencies and run the provisioning scripts.
Please follow the [installation instructions](https://python-poetry.org/docs/#installation) to install poetry.

## Usage

```bash
# To list all available tasks run:
task --list

# Run the playbook
task play -- ansible/{{ file }}.yml

# Run the linting for all playbooks in the ansible directory
task lint
```
