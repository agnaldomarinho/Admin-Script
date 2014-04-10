#!/bin/bash                                                      
#------------------------------------------------------------------------------
# Created by agnaldo marinho: agnetonho[at]gmail[dot]com
#------------------------------------------------------------------------------
#This program is free software: you can redistribute it and/or modify
#it unde the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful, 
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICUKAR PURPOSE. See the
#GNU General Public License for more details;
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>.
#-----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
#
# Script de criacao de swap no arquivo
#
# ----------------------------------------------------------------------------
echo "Iniciando o script de criacao de swap no arquivo"
echo "qual o tamanho da swap gostaria de criar?"
echo "Por exemplo digite 2000 se quiser 2GB assim podiante"
read tam
# Aqui voce gera um arquivo do tamanho que o usuario entrar
dd if=/dev/zero of=/swap bs=1M count=$tam
# Aqui voce criar um arquivo do tipo swap
mkswap /swap
# Ativando o swap
swapon /swap 
# Escrevendo no /etc/fstab para que ele posso montar 
# Automaticamento quando iniciar o sistema
echo "/swap   none 		swap   sw  0 0" >> /etc/fstab
echo "finalizando a criacao do arquivo swap"
echo "verifique o /etc/fstab para ver se esta tudo certo"

echo "Obrigado por usar o script"
