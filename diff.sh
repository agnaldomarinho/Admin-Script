#!/bin/bash
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
# Script verifica a direferença entre dois diretorios
#
#-----------------------------------------------------------------------------
#############################################################################
if [ $# -ne 2 ]
then
    echo "Uso: $0 <dir1> <dir2>"
    exit 1
fi
         
dir1="$1"
dir2="$2"
list="/tmp/$$.list"
cont="/tmp/$$.cont"
 
cd $dir1
find -type f | sed 's/^\.\///' > $list
cd - > /dev/null
 
echo "Analisando diferenças entre diretórios:"
echo "- $dir1"
echo "- $dir2"
 
while read arq
do
    if ! diff $dir1/$arq $dir2/$arq > $cont
    then
        echo -e "\n$arq:"
        cat $cont
    fi
done < $list
                                             
rm -f $list $cont
         
exit 0
