#! /bin/bash
#install packages
echo "Installing packages"
echo "Respond yes to any queries"
sudo apt update
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo apt install python3-venv
sudo apt install nginx
sudo apt install git

#set up project directory
echo "creating project directory..."
cd ~
git clone https://github.com/zsweedyk/cs121.git

#create virtual environment
cd ~/cs121
mkdir ~/cs121/static
mkdir ~/cs121/app/models
chown :www-data static
python3.6 -m venv myenv
source myenv/bin/activate
pip install -r requirements.txt
deactivate

#site/service set up
#set up service
sudo cp ~/cs121/setup/cs121.service /etc/systemd/system/
#create/install nginx site
echo "Enter the Public DNS (IPv4) of your ec2 site (e.g. on my machine it is ec2-13-52-184-22.us-west-1.compute.amazonaws.com)"
read ip
sed "s/ip4/$ip/g" ~/cs121/setup/cs121template > ~/cs121/setup/cs121
sudo cp ~/cs121/setup/cs121 /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/cs121 /etc/nginx/sites-enabled
#edit default nginx.conf to avoid hash_bucket_size problem
sudo cp /etc/nginx/nginx.conf ~/cs121/setup/tmp
sudo chown ubuntu ~/cs121/setup/tmp
sudo sed 's/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 128/' ~/cs121/setup/tmp > nginx.conf
sudo rm ~/cs121/setup/tmp
sudo chown root ~/cs121/setup/nginx.conf
sudo mv ~/cs121/setup/nginx.conf /etc/nginx/nginx.conf
#add fix for race condition problem starting up nginx
sudo mkdir -p /etc/systemd/system/nginx.service.d
sudo cp ~/cs121/setup/override.conf /etc/systemd/system/nginx.service.d/
sudo ufw allow 'Nginx Full'

#start it all up
sudo systemctl daemon-reload
sudo systemctl start cs121
sudo systemctl restart cs121
sudo systemctl enable cs121
sudo systemctl start nginx
sudo systemctl restart nginx

