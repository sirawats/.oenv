#!/bin/bash

# Generate public keys 
# ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub $1
