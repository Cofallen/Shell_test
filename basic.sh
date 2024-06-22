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
    print_msg "This script must be run as root. Please run with sudo." | tee -a  /home/cofallen/Bash-code/log.txt
    exit 1
fi

print_msg "Shell script execution completed."  >>  /home/cofallen/Bash-code/log.txt

# check cmake install

if !command -v cmake &> /dev/null; then 
    print_msg "cmake not install, continue to install cmake" | tee -a $FILE
    sudo apt-get update
    sudo apt-get install cmake -y
    print_msg  "cmake install finished" >> $FILE
else
    print_msg "cmake already install" >> $FILE
fi

cmake_version=$(cmake --version | head -n 1 | cut -d ' ' -f 3)
required_version="3.0"

if [[ "$(printf '%s\n' "$required_version" "cmake_version" | sort -V | head -n 1)" = "$required_version" ]]; then
    print_msg "cmake version is too low. Update cmake..." >> $FILE
    sudo apt-get update | tee -a $FILE
    sudo apt-get install --only-upgrade cmake -y
    print_msg "cmake updated successfully." >> $FILE
else
    print_msg "cmake version is up to date" >> $FILE
fi


# check docker install

# if !command -v docker &> /dev/null; then
#     print_msg "docker not install, continue to install docker." >> FILE
#     sudo apt-get update
#     sudo apt-get install docker -y
#     print_msg "docker install finished" >> FILE
# else
#     print_msg "docker already install."
# check docker version

# current_docker_version=$(docker --version | awk '{print \$3'} | cut -d ',' -f1)
# minumun_version='20.10.0'

# if dpkg --compare-version "$current_docker_version" "lt" "$minumun_version"; then
#     print_msg "docker version is too low. Update docker ..." >> FILE
#     sudo apt-get update
#     sudo apt-get install --only-upgrade docker-ce -y
#     print_msg "docker updated successfully." >> FILE
# else
#     print_msg "docker version is up to date." >> FILE
# fi


