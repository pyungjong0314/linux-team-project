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
# 리스트 배열 선언

list=()
for ((i=1; i<20; i++)); do
  list[$i]="=   $((i))) ${ssh_list[i-1]}"
done

current_index=0


# 스크롤 리스트 출력 하위 함수
print_list() {
  start_index=$1
  end_index=$2

  for ((i=start_index+1; i< end_index + 2; i++)); do
    echo "${complete_array[$i]}"
  done
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
str16_1="=                                             [접속하기]                                          ="
str16_2="=                                           >>[접속하기]                                          ="
array2=("$str16_1" "$str16_2")
current_index2=0

# 위쪽 방향키로 인덱스 1 감소
function move_up {
  if (( current_index > 0 )); then
    let "current_index-=1"
  fi
}

# 아래쪽 방향키로 인덱스 1 증가
function move_down {
  if (( current_index < ${#complete_array[@]} + 1 )); then
    ((current_index=current_index+1))
  fi
}

# 오른쪽 방향키로 인덱스 1 증가
function move_right {
  if (( current_index2 < ${#array2[@]} - 1 )); then
    let "current_index2+=1"
  fi
}
 
# 왼쪽 방향키로 인덱스 1 감소
function move_left {
  if (( current_index2 > 0 )); then
    ((current_index2=current_index2-1))
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

# 선택 표시가 있는 리스트 정의
complete_array=()
for ((i=1; i<20; i++)); do
  complete_array[$i]=${array[$i]}
done
complete_array[$current_index]=${arrow_array[$current_index]}

# 선택 리스트 + 스크롤 출력 함수
print_scrollable_list() {
  total_items=${#list[@]}
  items_per_page=9

  if (( current_index < items_per_page )); then
    start_index=0
    end_index=$(( items_per_page - 1 ))
  else
    start_index=$(( current_index - items_per_page + 1 ))
    end_index=$(( current_index ))
  fi

  print_list "$start_index" "$end_index"

  echo "$str6"
  echo "$str2"

}

# 리스트 선택 출력
clear
print_box 0
print_scrollable_list
echo "${array2[$current_index2]}"
echo "$str2"
echo "$str1"
echo "$str7"
done


# 화살표 방향키 입력 받기
while true; do
  read -n 1 key
  case "$key" in
    "") 
      if [[ ${current_index2} -eq 0 ]]; then
        . register.sh
      elif [[ ${current_index2} -eq 1 ]]; then
        . delete.sh
      fi
      break;;
    $'\x1b')
      read -n 1 -t 0.01 -s key
      if [[ "$key" == "[" ]]; then
        read -n 1 -t 0.01 -s key
        case "$key" in
          "C") 
            move_right;;
          "D") 
            move_left;;
        esac
      fi;;
    #general key input
    "s")
      ssh=${ssh_list[$current_index-1]}
      key_path=${key_list[$current_index-1]}
      . ./connect.sh ${ssh} ${key}
      break;;
    "g")
      . ./keygen.sh
      break;;
    *)
      ;;
  esac

# 방향키 박스 출력
clear
print_box 0
print_scrollable_list
echo "${array2[$current_index2]}"
  echo "$str2"
  echo "$str1"
  echo "$str7"
done