#!/bin/bash

IFS_backup="$IFS"
IFS=$'\n'
ssh_list=(`cat ssh.txt`)
`rm -rf ssh.txt`
file="./ssh.txt"
IFS="$IFS_backup"

for index in "${ssh_list[@]}"; do
    echo $index
done

for index in "${ssh_list[@]}"; do 
    echo $index >> ${file}
done

declare -i num
passport=""

while true; do
    read -p "등록하고 싶은 번호를 입력하시오(종료: -1 입력): " num
    echo $num
    if [[ $num -gt 0 && $num -lt 10 ]]; then
        read -p "등록하고자 하는 SSH 주소를 작성해주십시오: " passport
        ssh_list[num-1]=${passport}
    elif [[ $num -eq -1 ]]; then
        break
    else
        echo "리스트의 범위는 1~9입니다. 다시 입력해주세요."
    fi
done

# 파일에 변경된 리스트 저장
for index in "${ssh_list[@]}"; do 
    echo $index >> ${file}
done
