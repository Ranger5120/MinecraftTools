#!/bin/sh


function prepare()
{
    
    if [ ! -d "/home/sever" ]
    then
    mkdir -p /home/sever
    cd /home/sever
    wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.21.0.zip

    unzip bedrock-server-1.14.21.0.zip 
    fi
    cd
}

function StartSever()
{
    LD_LIBRARY_PATH=. ./bedrock_server
}

function Properties()
{
    echo "==============================================="
    cd /home/sever 
    vim sever.properties
    main
}

function Whitelist()
{
    echo "==============================================="
    cd /home/sever
    vim whitelist.json
    main
}

function Permission()
{
    echo "==============================================="
    cd /home/sever
    vim permissions.json
    main
}

function main()
{
    echo "==============================================="
    while :
    do
    echo "[1]启动服务器 [2]管理服务器属性文件 [3]管理白名单"
    echo "[4]管理成员属性"
    echo
        read main1
            case $main1 in
            1)StartSever
            break;;
            2)Properties
            break;;
            3)Whitelist
            break;;
            4)Permission
            break;;
        esac
    done
}

echo "欢迎使用"
prepare
echo "准备完毕"
echo "================================================="
main
