#!/bin/bash

#DIRECTORIES
echo "Removing directies..."
rmdir /publico /adm /ven /sec

#GROUPS
echo "Removing groups..."
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

#USERS
echo "Removing users..."

allUsers=("carlos" "maria" "joao" "debora" "sebastian" "roberto" "josefina" "amanda" "rogerio")

for user in ${allUsers[@]};do
	userdel -r $user
done

echo "Finishing execution"