[![Build Status](https://travis-ci.org/hurricanehrndz/ansible-openssh.svg?branch=master)](https://travis-ci.org/hurricanehrndz/ansible-openssh)

# ansible-openssh

[OpenSSH](https://wikipedia.org/wiki/OpenSSH) - the OpenBSD Secure Shell

[![Licence](https://img.shields.io/badge/License-MIT-blue.svg)](https://tldrlegal.com/license/mit-license)
[![Platforms](http://img.shields.io/badge/platforms-ubuntu-lightgrey.svg?style=flat)](#)

## Description

OpenSSH is a suite of security-related network-level utilities based on the SSH
protocol, which help to secure network communications via the encryption of
network traffic over multiple authentication methods and by providing secure
tunneling capabilities.

## Tunables

* `openssh_client` (boolean) - Install as client?
* `openssh_server` (boolean) - Install as server?
* `openssh_ports` (list) - Ports to listen on
* `openssh_append_ciphers` - (list) ciphers to append to openssh_default_ciphers
* `openssh_append_key_exchange_algorithms` - (list) key exchanges to append to openssh_default_key_exchange_algorithms
* `openssh_append_mac_algorithms` - (list) message integrety checking to append to openssh_default_mac_algorithms
* `openssh_default_ciphers` (list) - Ciphers to allow (prefer openssh_append_key_exchange_algorithms when possible)
* `openssh_default_key_exchange_algorithms` (list) - Key Exchange Algorithms to allow (prefer openssh_append_ciphers when possible)
* `openssh_default_mac_algorithms` (list) - MAC Algorithms to allow (prefer openssh_append_mac_algorithms when possible)
* `openssh_auth_methods` (list) - Set ssh daemon AuthenticationMethods i.e. ("publickey", "publickey,keyboard-interactive:pam")
* `openssh_users_and_auth_methods` (dictionary list) - Set AuthenticationMethods for specific users.

## Dependencies

* None

## Example Playbook
```yaml

    - hosts: servers
      roles:
         - role: ansible-openssh
           openssh_server: yes
           openssh_client: yes

## Static Host Key
           openssh_static_host_keys:
            rsa:
                public: |
                    REDACT
                private: |
                    REDACT
            ed25519:
                public: |
                    REDACT
                private: |
                    REDACT
```

## Example Playbook 2FA for all 1FA for kitchen
```yaml
- hosts: test-kitchen
  remote_user: root

  roles:
    # name of role to test
    - role: ansible-openssh
      openssh_client: yes
      openssh_server: yes
      openssh_auth_methods:
        - "publickey"
        - "keyboard-interactive:pam"
      openssh_users_and_auth_methods:
        - user: "kitchen"
          auth_method: "publickey"
      openssh_kbd_interactive_auth: "yes"
```

## Contributors

* [Chris Olstrom](https://colstrom.github.io/) | [e-mail](mailto:chris@olstrom.com) | [Twitter](https://twitter.com/ChrisOlstrom)
* Steven Harradine
* Aaron Pederson
* Carlos Hernandez(https://github.com/hurricanehrndz) | [e-mail](mailto:carlos@techbyte.ca) | [Twitter](https://twitter.com/hurricanehrndz)

