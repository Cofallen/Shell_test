#!/bin/bash

# 打印绿色时间戳
GREEN='\033[0;32m'  # 设置绿色颜色代码
NC='\033[0m'       # 恢复默认颜色
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

print_msg(){
    MSG=$1
    echo -e "${GREEN}[${TIMESTAMP}] ${MSG}${NC}"
}

# 检查是否有日志文件
FILE=/home/cofallen/Bash-code/log.txt
if [[ -f "${FILE}" ]];then
    print_msg "清除残留日志文件..."
    rm ${FILE}
    print_msg "日志清理完成!!!"
else 
    print_msg "建立日志文件"
    touch ${FILE}
fi

if [[ "$(id -u)" != "0" ]];then  # 获取UID
    print_msg "This script must be run as root. Please run with sudo." | tee -a /home/cofallen/Bash-code/log.txt
    exit 1
fi

print_msg "Shell script execution completed." | tee -a /home/cofallen/Bash-code/log.txt
