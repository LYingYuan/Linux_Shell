#!/bin/bash

# 改变下载源
function changeSource()
{
mv /etc/apt/sources.list /etc/apt/sources.list.backup
echo -e "\033[32m已备份原 sources.list 至 sources.list.backup\033[0m"
touch /etc/apt/sources.list
cat << EOF > /etc/apt/sources.list
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
EOF

apt update
apt upgrade

echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                   换源完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

menu
}

# 安装常用软件
function install()
{
#安装 Vim
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装Vim                       #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y vim
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                Vim安装完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 wget
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装wget                       #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y wget
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                wget安装完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 Git
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装Git                       #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y git
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                Git安装完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 gcc
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装gcc                       #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y gcc
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                gcc安装完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 g++
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装g++                       #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y g++
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                g++安装完成                     #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 cmake
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装cmake                      #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y cmake
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                cmake安装完成                    #\033[0m"
echo -e "\033[32m#################################################\033[0m"

# vim --version
# git --version
# gcc --version
# g++ --version
# cmake --version

menu
}

# 配置 C++ 环境
function configureCppEnvironment()
{
#安装 pcl
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装pcl                      #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y libpcl-dev
# TODO:需要键入一些数字
# 选择 Asia
# 6
# 70
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                pcl安装完成                    #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 opencv
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装opencv                      #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y libopencv-dev
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                opencv安装完成                    #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 eigen
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装eigen                      #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y libeigen3-dev
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                eigen安装完成                    #\033[0m"
echo -e "\033[32m#################################################\033[0m"

#安装 boost
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                 安装boost                      #\033[0m"
echo -e "\033[32m#################################################\033[0m"
apt install -y libboost-all-dev
echo -e "\033[32m#################################################\033[0m"
echo -e "\033[32m#                boost安装完成                    #\033[0m"
echo -e "\033[32m#################################################\033[0m"

menu
}

function menu()
{
echo "\033[32m################################################\033[0m"
echo "\033[32m#              Please enter your choise:       #\033[0m"
echo "\033[32m#              (0) 换源                        #\033[0m"
echo "\033[32m#              (1) 安装系统常用软件             #\033[0m"
echo "\033[32m#              (2) 配置C++运行环境              #\033[0m"
echo "\033[32m#              (q) Exit Menu                   #\033[0m"
echo "\033[32m#              制作by LYingYuan                #\033[0m"
echo "\033[32m################################################\033[0m"

read input

case $input in
  0)
    changeSource;;
  1)
    install;;
  2)
    configureCppEnvironment;;
  q)
    exit;;
esac
}

menu
