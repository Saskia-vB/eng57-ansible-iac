# Ansible and Infrastructure as code

We will cover:
- Infrastructure As Code (IAC)
- Configuration Management tools
- What is Ansible
- Why Ansible

- Installing ansible
- Create a multi environment set up
- use ansible to configure the environments
- file structures and ansible
- adhoc commands
- playbooks

### Infrastructure as code
- provisioning machines using code
- configure our infrastructure from source code
- our scripts live in isolation in our environments, then we pass it on to our production copy through our scp and if we make changes in one we need to replicate it in the other -> ansible solves that problem
- setting up infrastructure with code as opposed to clicking away
- have a source code that is more robust than isolated scripts

### Configuration Management tools
- the tools that put IAC into practice along with orchestration tools.
- configuration management tools include: Chef, Puppet, Ansible, otherssss

### Orchestration tools
- aim to configure the networking and deployment at scale
- tools include: Ansible, Terraform (hashicorp tool), otherssss

### Ansible
- helping to manage servers, on the operations side
- increase number of servers it is difficult to create consistent setup of different infrastructures - to maintain all by hand would be difficult -> ansible
- write one script and each script can be executed and have consistent environments
- how do we use them in our environment:
  1. IT automation: write instructions that automate IT setup
  2. Configuration: consistent configuration, guarantee with precision that all servers are set up identically
  3. Automate: push out instructions that can deploy automatically different servers
- high level language (more abstracted) for dealing with powershell vs bash environments. For dealing with different package managers. And generally, abstracting the more infrastructure agnostic.
- open source
- does all 4 pillars of DevOps in one: flexibility, ease of use, robustness and cost
- there are different syntaxes in different environments to do the same thing
- easy to use through YAML file for your playbooks
- it allows for a multi and hybrid cloud environment management
- allows us to set up and track several machines:
  - webserver
  - db
  - aws

#### Installation
- on windows, get a vm and install it on ubuntu distribution
- on mac, use python

### Ansible demo
- objectives:
  - emulate a real environment
  - create 3 machines
  - use ansible to manage them


##### Commands
- vagrant init
- vagrant plugin install vagrant-hostupdater

# Inventory
- where you specify your hosts

# hosts file
- specify machine
1. Create the global dir: sudo mkdir /etc/ansible
2. Copy in a configuration file: sudo curl -L https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg -o /etc/ansible/ansible.cfg
3. Verify it works with: ansible localhost -m ping

## Create ansible VM
- Vagrant file:
```ruby
config.vm.define "ansible" do |ansible|
  #specifying the box
  ansible.vm.box = "ubuntu/bionic64"

  #assign an ip
  ansible.vm.network "private_network", ip: "192.168.33.13"

  #assing a hostname for the vm
  ansible.vm.hostname = "ansible"

  #assing a hostname for browser access
  ansible.hostsupdater.aliases = ["development.ansible"]

end
```

- install ansible:
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible

- check ansible installation:
ansible --version

- add hosts:
$ cd /etc/ansible/
$ ls
(you should see hosts)
$ sudo nano hosts
- paste this into hosts:
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[aws]
192.168.33.12 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
- check if you can ping:
$ ping 192.168.33.10
$ ping 192.168.33.11
$ ping 192.168.33.12
- create ssh key
$ ssh-keygen
$ cd .ssh
$ cat id_rsa.pub
- copy and paste into vagrant ssh web > cd .ssh > sudo nano authorized_keys
- back on vagrant ssh ansible
$ sudo nano /etc/ssh/sshd_config
- change PermitRootLogin prohibit-password to PermitRootLogin yes
- change PasswordAuthentication no to PasswordAuthentication yes
- then, restart ssh service:
$ sudo service ssh restart
- back on vagrant ssh web
$ sudo nano /etc/ssh/sshd_config
- change PermitRootLogin prohibit-password to PermitRootLogin yes
- change PasswordAuthentication no to PasswordAuthentication yes
- then, restart ssh service:
$ sudo service ssh restart
$ sudo passwd root
- back on vagrant ssh ansible
$ ssh root@192.168.33.10 (web ip)
- enter password!
- to ping all machines:
$ ansible all -m ping
- cd /vagrant/
$ ansible-playbook playbook.yml
-> check indentation
-> output: 3 tasks, ok = 3


### Troubleshooting and errors

- if ERROR: "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."
- cd /etc/ansible
- sudo nano ansible.cfg
- enter: host_key_checking = false

- when running app you land only on nginx page
- add to playbook:
  - name: Remove nginx default files - sites available
    shell: rm /etc/nginx/sites-available/default

  - name: Remove nginx default files - sites enabled
    shell: rm /etc/nginx/sites-enabled/default

  - name: Copy nginx default file
    shell: cp /home/ubuntu/default.conf /etc/nginx/sites-available/default.conf

  - name: Symlink from sites available to sites enabled
    shell: ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf



- when running playbook for app and passing all the tasks but the webpage won't load: Error: Failed to lookup view "index" in views directory "/views"
-
- delete app folder
- clone functioning app folder i.e. sparta node sample app



- when running playbook do db:
  - Install MongoDb error: fatal: [192.168.33.11]: FAILED! => {"changed": false, "msg": "E:Malformed entry 1 in list file /etc/apt/sources.list.d/a.list (URI parse), E:The list of sources could not be read."}
  - vagrant ssh db
  - cd /etc/apt/sources.list.d
  - sudo nano a.list
  - comment out deb http
