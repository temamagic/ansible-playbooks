# Ansible playbooks

This repository contains a collection of Ansible playbooks that I use to manage my personal infrastructure.

## Playbooks

- `playbook_user.yml`: Create a new user and add it to the sudoers group.
- `playbook_secure.yml`: Secure the server by disabling root login, password authentication, adding a firewall with allowed only ssh, https and allowed cloudflare ips.
- `playbook_wireguard.yml`: Install and configure WireGuard between all inventory hosts and update all peers with the new configuration.

## Pre-setup
- Run `sh setup.sh` to creates symlink of youre key and install .githooks with pre-commit hooks


## Note!
IDK if this is the best way to do it, but it works for me. If you have any suggestions, please let me know.

`Use at your own risk.`