#!/bin/bash
declare -i num

# 리스트
IFS_backup="$IFS"
IFS=$'\n'
ssh_list=(`cat ssh.txt`)
key_list=(`cat key.txt`)
file="./ssh.txt"
key_file="./key.txt"
IFS="$IFS_backup"

#문자열 선언
str1="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
 str2="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="
 str3="= -                                                                                             - ="
 str4="= - uu                 *ssssssssss*          *ssssssssss* hh                                    - ="
 str5="= - uu              ssss  uu     ssss    ssss           sshh                                    - ="
 str6="= - uu               ssss  uu     ssss    ssss            hhss                                  - ="
 str7="= - uu                 sssss                sssss         hh   *hhhhhhh*                        - ="
 str8="= -  uu                 uu  ssssssssss         ssssssssss hhh          hh                       - ="
 str9="= -  uu                uu          sssss               ssshhs            hh                     - ="
str10="= -   uu              uu             ssss                shhss            hh                    - ="
str11="= -    uu          ssss            ssss    ssss           hhss            hh                    - ="
str12="= -      *uuuuuuuuu*   *ssssssssss*            *sssssssssshhs*            hh                    - ="
str13="= -                                                                                             - ="
str14="= -                                                                                             - ="
str15="= -                                                                                             - ="
str16="= -                                            [접속하기]                                        - ="
str17="= -                                                                                             - ="
str18="= -                                                                                             - ="
str19="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="
str20="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="

# 상자 함수

print_box() {
num=0
echo "$str1"
echo "$str2"
echo "$str3"
echo "$str4"
echo "$str5"
echo "$str6"
echo "$str7"
echo "$str8"
echo "$str9"
echo "$str10"
echo "$str11"
echo "$str12"
echo "$str13"
echo "$str14"
echo "$str15"
echo "$str16"
}



# 시작화면 출력

print_box 0

for ((i=1; i<16; i++)); do
  echo "${list[$i]}"
done

echo "$str1"
echo "$str2"
echo "$str3"
echo "$str4"
echo "$str5"
echo "$str6"
echo "$str7"
echo "$str8"
echo "$str9"
echo "$str10"
echo "$str11"
echo "$str12"
echo "$str13"
echo "$str14"
echo "$str15"
echo "$str16"

# 기능 배열 정의
str16_1="=                                             [접속하기]                                          ="
str16_2="=                                           >>[접속하기]                                          ="
array2=("$str16_1" "$str16_2")
current_index2=0

# 엔터키로 인덱스 1 감소
function move_up {
  if (( current_index > 0 )); then
    let "current_index-=1"
  fi
}

# 화살표 방향키 입력 받기
while true; do
  read -n 1 key
  case "$key" in
    "") 
      break;;
    $'\x1b') 
      read -n 1 -t 0.01 -s key
      if [[ "$key" == "[" ]]; then
        read -n 1 -t 0.01 -s key
        case "$key" in
          "A")
            move_up;;
          "B") 
            move_down;;
        esac
      fi;;
    *)
      ;;
  esac
done