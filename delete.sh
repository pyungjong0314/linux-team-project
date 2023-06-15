#!/bin/bash

IFS_backup="$IFS"
IFS=$'\n'
ssh_list=(`cat ssh.txt`)
key_list=(`cat key.txt`)
`rm -rf key.txt`
`rm -rf ssh.txt`
file="./ssh.txt"
key_file="./key.txt"
IFS="$IFS_backup"

# for index in "${ssh_list[@]}"; do
#     echo $index
# done

declare -i num

while true; do
    read -p "삭제할 SSH 주소의 번호를 입력해주십시오(종료: -1 입력): " num
    echo $num
    if [[ $num -eq -1 ]]; then
        break
    elif [[ $num -gt 0 && $num -lt 20 ]]; then
        ssh_list[num-1]=null
        key_list[num-1]=null
        echo "주소가 삭제되었습니다."
    else
        echo "리스트의 범위는 1~19입니다. 다시 입력해주세요."
    fi

    # 변경된 리스트 출력
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
