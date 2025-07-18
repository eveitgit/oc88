# install
apt install net-tools nginx 
systemctl enable nginx 

useradd jenkins -m -s /bin/bash
mkdir /home/jenkins/.ssh 
chown jenkins:jenkins -R /home/jenkins/.ssh 


#jenkins ALL=(ALL) NOPASSWD:ALL
