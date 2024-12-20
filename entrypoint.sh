
#!/bin/bash
set -e
npm cache clean --force
rm -rf /usr/local/lib/node_modules/rtlcss

# تثبيت حزم npm
 npm install -g less less-plugin-clean-css rtlcss

# تحديث وترقية النظام
apt-get update && sudo apt-get upgrade -y

# تثبيت الحزم المطلوبة
apt install -y zip gdebi net-tools git python3-pip build-essential wget python3-dev python3-venv python3-wheel libfreetype6-dev libxml2-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libjpeg-dev zlib1g-dev libxslt1-dev libldap2-dev libtiff5-dev libjpeg8-dev libopenjp2-7-dev liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev nodejs

# تثبيت مكتبات Python
apt install meson ninja-build
apt install libcairo2-dev python3-cairo-dev
pip3 install gdata psycogreen suds rlPyCairo phonenumbers
pip3 install greenlet gevent

# تثبيت متطلبات Odoo
pip3 install -r https://raw.githubusercontent.com/odoo/odoo/17.0/requirements.txt --user
exit 1
