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
