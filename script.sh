#/bin/sh!
#chmod 777 /tmp/script.sh
#sudo su -

sudo yum install httpd -y
sudo service httpd start
sudo echo "this is up, I DID IT" >> /var/www/html/index.html

sudo curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops


sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo echo "export KOPS_CLUSTER_NAME=bucket-for-kubernetes-config-k8s.in" >> /root/.bash_profile
sudo echo "export KOPS_STATE_STORE=s3://bucket-for-kubernetes-config-k8s" >> /root/.bash_profile

sudo source /root/.bash_profile

sudo ssh-keygen -y

sudo kops create cluster \
--state=${KOPS_STATE_STORE} \
--node-count=2 \
--master-size=t2.micro \
--node-size=t2.micro \
--zones=ap-south-1a,ap-south-1b \
--name=${KOPS_CLUSTER_NAME} \
--dns private \
--master-count 1

sudo kops update cluster --yes
