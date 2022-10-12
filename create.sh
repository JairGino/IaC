#!/bin/bash

#DIRECTORIES
echo "Creating directories..."
mkdir /publico /adm /ven /sec

#GROUPS
echo "Creating groups..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

#USERS
echo "Creating users..."
groupAdm=("carlos" "maria" "joao")
groupVen=("debora" "sebastian" "roberto")
groupSec=("josefina" "amanda" "rogerio")

for user in ${groupAdm[@]};do
        #useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -e -G GRP_ADM $user
	useradd -c "Adm. $user" -m -s /bin/bash -G GRP_ADM $user
	echo "$user:Senha123" | chpasswd
	passwd $user -e
done

for user in ${groupVen[@]};do
	useradd -c "Ven. $user" -m -s /bin/bash -G GRP_VEN $user
	echo "$user:Senha123" | chpasswd
	passwd $user -e
done

for user in ${groupSec[@]};do
        useradd -c "Sec. $user" -m -s /bin/bash -G GRP_SEC $user
	echo "$user:Senha123" | chpasswd
	passwd $user -e
done

echo "Especifying directory permissions..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
echo "Finishing execution"