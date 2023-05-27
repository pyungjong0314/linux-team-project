#!/bin/bash

echo ${ssh}

who=`whoami`
num=${current_index}
rsa="id_rsa_$num.pub"

# RSA 키 파일 경로
private_key_path="/home/$who/.ssh/$rsa"

# SSH 접속 명령어
ssh_command="ssh -i $private_key_path $ssh"

# SSH 서버에 접속
$ssh_command
