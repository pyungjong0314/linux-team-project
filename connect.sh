#!/bin/bash

echo $(clear)

echo ${ssh}
echo ${key_path}

# SSH 접속 명령어
ssh_command="ssh -i $key_path $ssh"

# SSH 서버에 접속
$ssh_command
