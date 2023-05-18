#!/bin/bash
declare -i num

#문자열 선언

str1="= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
str2="=                                                                                                 ="
str3="=                                          << Ussh >>                                             ="
str4="=   List                                                                                          ="
str5="=        [등록하기]                           [수정하기]                         [삭제하기]       ="
str6="= - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ="

# 상자 함수

print_box() {
num=0
echo "$str1"
echo "$str2"
echo "$str3"
echo "$str2"
echo "$str6"
echo "$str2"
echo "$str4"
}

# 리스트 번호 출력 함수

print_list(){
for ((i=0; i<9; i++)); do
  num=${num}+1
  echo "=   " ${num}")                                                                                           ="
done

for ((i=0; i<3; i++)); do
    echo "$str2"
done
}


# 시작화면 출력

print_box 0
print_list 0
echo "$str6"
echo "$str2"
echo "$str5"
echo "$str2"
echo "$str1"


# 리스트 선택

array=()
for ((i=1; i<10; i++)); do
  array[$i]="=   ${i})                                                                                            ="
done

array_1=()
current_index=0

for ((i=1; i<10; i++)); do
  array_1[$i]="=  >> ${i})                                                                                          ="
done



# 기능 배열 정의
str5_1="=      >>[등록하기]                           [수정하기]                         [삭제하기]       ="
str5_2="=        [등록하기]                         >>[수정하기]                         [삭제하기]       ="
str5_3="=        [등록하기]                           [수정하기]                       >>[삭제하기]       ="
array2=("$str5_1" "$str5_2" "$str5_3")
current_index2=0


# 위쪽 방향키로 인덱스 1 감소
function move_up {
  if (( current_index > 0 )); then
    let "current_index-=1"
  fi
}

# 아래쪽 방향키로 인덱스 1 증가
function move_down {
  if (( current_index < ${#array1[@]} + 1 )); then
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

# 선택 리스트 배열 정의
array1=()
for ((i=1; i<10; i++)); do
  array1[$i]=${array[$i]}
done
array1[$current_index]=${array_1[$current_index]}

# 선택 리스트 출력 함수
print_list2(){
for ((i=0; i<9; i++)); do
  num=${num}+1
  echo "${array1[$num]}"
done

for ((i=0; i<3; i++)); do
    echo "$str2"
done

  echo "$str6"
  echo "$str2"
  stty -echo
}  

# 리스트 선택 출력
clear
print_box 0
print_list2
echo "${array2[$current_index2]}"
echo "$str2"
echo "$str1"
done
stty -echo


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
          "C") 
            move_right;;
          "D") 
            move_left;;
        esac
      fi;;
    *)
      ;;
  esac
  
# 방향키 박스 출력
clear
print_box 0
print_list2
echo "${array2[$current_index2]}"
  echo "$str2"
  echo "$str1"
done