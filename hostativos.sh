#!/bin/bash

# Script de verificação de host ativos


echo " ########   ##   ##   #######  ######  ##      ##   ######        "
echo " ##         ##   ##   ##   ##  ##   #  ##      ##   ##            "
echo " ##         #######   #######  ######  ##      ##   #####         "
echo " ##         ##   ##   ##   ##  ## ##   ##      ##   ##            "
echo " ########   ##   ##   ##   ##  ##  ##  #####   ##   ######        "


if  [ "$1" == "" ]
then 
echo "script de host"
echo "exemplo de uso"
echo  "./script 192.168.0"
else
echo "digite nome de um arquivo .txt"
read arquivo

echo "verificando host"

for ip in {1..254};do
ping -c1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | cut -d":" -f 1 > $arquivo
done 
fi
#Varredura nmap
echo "host Atvos"
cat $arquivo
echo "varredura  de portas"

nmap -Pn  -iL $arquivo  --script vuln
 
