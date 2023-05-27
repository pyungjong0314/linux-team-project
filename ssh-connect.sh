HEIGHT=20
WIDTH=80
CHOICE_HEIGHT=20 # 리스트 출력 개수
BACKTITLE="USSH"
TITLE="Server instances"
MENU="Choose one of the following options:"

OPTIONS=(1 "kpop printshop front server (i-091389f09324e6256)"
         2 "kpop printshop admin api server (i-06ce721057f78dcc0)"
         3 "kpop batch server (i-0b2b1878f6778261e)"
         4 "kpop api server (i-0042ee0f91efd37f2)"
         5 "bfactory utils server (i-09a8f4c0cdd711fd3)"
         6 "bfactory cimpress api server (i-0b126003dab563e13)"
         7 "bfactory admin batch server (i-0f481ea8012469a8e)"
         8 "bfactory admin api and front server (i-08e627cd197c3100e)"
 )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

SERVER_KEY=/home/ubuntu/.aws/aws-server-key.pem

clear
case $CHOICE in
        1)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
            ;;
        2)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
            ;;
        3)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
            ;;
        4)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
                ;;
        5)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
                ;;
        6)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
                ;;
        7)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
                ;;
        8)
                ssh -i "$SERVER_KEY" ubuntu@172.xxx.xxx.xxx
                ;;
esac
