#!/bin/bash
DESTINATION=$1
PORT=$2
CHAT=$3
PORT8069=$4
PORT8072=$5
# clone Odoo directory
git clone --depth=1 https://github.com/mahmoudhashemm/Hello-odoo17.git $DESTINATION
rm -rf $DESTINATION/.git
# set permission
mkdir -p $DESTINATION/postgresql
mkdir -p $DESTINATION/enterprise
chmod +x $DESTINATION/entrypoint.sh
sudo chmod -R 777 $DESTINATION
# config
if grep -qF "fs.inotify.max_user_watches" /etc/sysctl.conf; then echo $(grep -F "fs.inotify.max_user_watches" /etc/sysctl.conf); else echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf; fi
sudo sysctl -p
sed -i 's/10019/'$PORT'/g' $DESTINATION/docker-compose.yml
sed -i 's/20014/'$CHAT'/g' $DESTINATION/docker-compose.yml
sed -i 's/8069/'$PORT8069'/g' $DESTINATION/docker-compose.yml
sed -i 's/8072/'$PORT8072'/g' $DESTINATION/docker-compose.yml
# run Odoo
docker-compose -f $DESTINATION/docker-compose.yml up -d

echo 'Started Odoo @ http://localhost:'$PORT' | Master Password: Omar@012 | Live chat port: '$CHAT
