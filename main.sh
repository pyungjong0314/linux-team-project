#!/bin/bash

# 문자열 선언
str1="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
str2="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="
str3="= -                                                                                             - ="
str4="= - uu                  uu       *ssssssssss*         *ssssssssss*         hh                   - ="
str5="= - uu                  uu    ssss         ssss    ssss         ssss       hh                   - ="
str6="= - uu                  uu     ssss         ssss    ssss          ssss     hh                   - ="
str7="= - uu                  uu       sssss                sssss                hh  *hhhhh*          - ="
str8="= -  uu                 uu           ssssssssss           ssssssssss       hh hh      hh        - ="
str9="= -  uu                uu                    sssss                 sssss   hh          hh       - ="
str10="= -   uu             uu                       ssss                  ssss  hh           hh       - ="
str11="= -    uu          uu          ssss         ssss    ssss         ssss     hh           hh       - ="
str12="= -      *uuuuuuuu*              *ssssssssss*         *sssssssssss*       hh           hh       - ="
str13="= -                                                                                             - ="
str14="= -                                                                                             - ="
str15="= -                                                                                             - ="
str16_1="= -                                      [접속하기]                                         - ="
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
  echo "$1"
  echo "$str17"
  echo "$str18"
  echo "$str19"
  echo "$str20"
}

# 기능 배열 정의
str16_1="=                                   [접속하기]                                                  ="
str16_2="=                                 >>[접속하기]                                                  ="

# 시작화면 출력
print_box "$str16_1"

# 화살표 방향키 입력 받기
while true; do
  read -n 1 key
  case "$key" in
  "")
   # 상자 출력
    clear
    print_box "$str16_2"
    break
      ;;

    *)
      ;;
  esac

done
  
  while true; do
  read -n 1 key
  case "$key" in
  "")
     clear
    . ./Linux.sh
      ;;

    *)
      ;;
  esac
done