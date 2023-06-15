#!/bin/bash
declare -i num

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
str15="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="
str16="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="


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


# 리스트 선택
array=()
for ((i=1; i<20; i++)); do
  array[$i]="=   ${i}) ${ssh_list[i-1]}"
done

# >>표시가 있는 리스트 선언
arrow_array=()
current_index=0

for ((i=1; i<20; i++)); do
  arrow_array[$i]="=  >> ${i}) ${ssh_list[i-1]}"
done




# 기능 배열 정의
str5_1="=               >>[등록하기]                                                 [삭제하기]           ="
str5_2="=                 [등록하기]                                               >>[삭제하기]           ="
array2=("$str5_1" "$str5_2")
current_index2=0