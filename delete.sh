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
declare -i passport

while true; do
    read -p "등록하고 싶은 번호를 입력하시오(종료: -1 입력, 삭제: 0 입력): " num
    echo $num
    if [[ $num -eq -1 ]]; then
        break
    elif [[ $num -eq 0 ]]; then
        read -p "삭제하고자 하는 SSH 주소의 번호를 입력해주세요: " delete_num
        if [[ $delete_num -gt 0 && $delete_num -le ${#ssh_list[@]} ]]; then
            unset ssh_list[delete_num-1]
            echo "SSH 주소가 삭제되었습니다."
        else
            echo "유효하지 않은 번호입니다. 다시 입력해주세요."
        fi
    elif [[ $num -gt 0 && $num -lt 10 ]]; then
        read -p "등록하고자 하는 SSH 주소를 작성해주십시오: " passport
        ssh_list[num-1]=${passport}
        echo "SSH 주소가 등록되었습니다."
    else
        echo "리스트의 범위는 0~9입니다. 다시 입력해주세요."
    fi
done

# 파일에 변경된 리스트 저장
for index in "${ssh_list[@]}"; do 
    echo $index >> ${file}
done
