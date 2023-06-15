#!/bin/bash

IFS_backup="$IFS"
IFS=$'\n'
ssh_list=(`cat ssh.txt`)
key_list=(`cat key.txt`)
`rm -rf ssh.txt`
`rm -rf key.txt`
key_file="./key.txt"
file="./ssh.txt"
IFS="$IFS_backup"

# for index in "${ssh_list[@]}"; do
#     echo $index
# done

declare -i num
passport=""

while true; do
    read -p "등록하고 싶은 번호를 입력하시오(종료: -1 입력): " num
    echo $num
    if [[ $num -gt 0 && $num -lt 20 ]]; then
        read -p "등록하고자 하는 서버의 사용자명@SSH 주소를 작성해주십시오: " passport
        read -p "등록하고자 하는 서버의 private key path를 입력해주세요. : " key
        ssh_list[num-1]=${passport}
        key_list[num-1]=${key}
    elif [[ $num -eq -1 ]]; then
        break
    else
        echo "리스트의 범위는 1~19입니다. 다시 입력해주세요."
    fi
    # # 변경된 리스트 출력
    # echo "변경된 리스트:"
    # for index in "${ssh_list[@]}"; do 
    #     echo $index
    # done
done

# 파일에 변경된 리스트 저장
for index in "${ssh_list[@]}"; do 
    echo $index >> ${file}
done

for index in "${key_list[@]}"; do
    echo $index >> ${key_file}
done

. Linux.sh
