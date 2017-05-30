#!/bin/bash

##########################################################################
# Script para envio de comandos por telnet para varios equipamentos faixa de IP
# Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia
##########################################################################



clear
echo -e "################################## SCRIPT TELNET #####################################"
echo -e "# Script para envio de comandos por telnet para varios equipamentos numa faixa de IP #"
echo -e "# Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia                #"
echo -e "######################################################################################\n\n"


read -p "Digite a faixa de IP (ex:192.168.0. ): " faixa
read -p "Digite o primerio IP (ex:10): " inicio
read -p "Digite o ultimo IP (ex:254): " fim
read -p "Digite a porta telnet (ex:23): " porta
read -p "Digite o IP do servidor TFTP, se o script telnet necessitar (ex:192.168.0.20): " servtftpip
read -p "Digite o usuario (ex:dmaia): " username
read -p "Digite a senha (ex:password): " password
echo -e "\n==============================="
echo -e "Executando script nos IP´s $faixa$inicio até $faixa$fim"


for((i=$inicio;i<=$fim;i++))
 do
   		
	###################################
	# Logando no telnet do equipamento
	###################################

	{ sleep 2;echo '\n';sleep 2;echo $username; sleep 2;echo $password; sleep 2;echo "configure t"; sleep 2; echo "interface virtual-ethernet0/0/0"; sleep 2; echo "active-ethernet capable"; sleep 2; echo "end"; sleep 2; echo "copy running-config startup-config"; sleep 2; echo "close"; echo "exit"; } | telnet $faixa$i $porta
	echo -e "\nEquipamento $IP - Enviado comandos"
	   
done


echo -e "\n ###############################################################################"
echo -e "\n SCRIPT TELNET CONCLUIDO"
echo -e "\n ###############################################################################\n\n"