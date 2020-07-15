
# Install ansible
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

sudo echo "[web]" >> /etc/ansible/hosts
sudo echo "192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> /etc/ansible/hosts
sudo echo "[aws]" >> /etc/ansible/hosts
sudo echo "192.168.33.12 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> /etc/ansible/hosts

# [web]
# 192.168.10.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
# [db]
# 192.168.10.20 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
# [aws]
# 192.168.10.30 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
