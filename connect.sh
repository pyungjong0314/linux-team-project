#!/bin/bash

echo ""
echo ${ssh}

public_key_path=""

#public key path
read -p "private key path : " public_key_path

# SSH 접속 명령어
ssh_command="ssh -i $public_key_path $ssh"

# SSH 서버에 접속
$ssh_command
