#!/bin/bash

# 문자열 선언
str1="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
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
str16="= -                                      [접속하기]                                           - ="
str17="= -                                                                                             - ="
str18="= -                                                                                             - ="
str19="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="
str20="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="

# 상자 출력 함수
print_box() {
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
  echo "$str17"
  echo "$str18"
  echo "$str19"
  echo "$str20"
}

# 시작화면 출력
print_box

# 기능 배열 정의
str16_1="=                                      [접속하기]                                          ="
str16_2="=                                    >>[접속하기]                                          ="
array2=("$str16_1" "$str16_2")
current_index2=0

# 엔터키로 인덱스 1 감소
function move_up {
  if (( current_index2 > 0 )); then
    let "current_index2-=1"
  fi
}

# 화면 이동 함수
function move_to_list {
  clear
  echo "화면을 Linux.sh로 이동"
  ./Linux.sh
  exit 0
}

# 화살표 방향키 입력 받기
while true; do
  read -rsn1 key
  case "$key" in
    "")
      if (( current_index2 == 1 )); then
        move_to_list
      else
        current_index2=1
      fi
      ;;
    $'\x1b')
      read -rsn2 -t 0.01 key
      if [[ "$key" == "[" ]]; then
        read -rsn1 -t 0.01 key
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
  # 상자 출력
  clear
  print_box
  echo "${array2[current_index2]}"
done