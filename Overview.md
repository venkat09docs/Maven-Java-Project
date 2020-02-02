# Jenkins-Project

5 Nodes:
  - Jenkins Master
    - SSH Keys
    - Jenkins Installation
  - Jenkins Slave (Build Server)
    - Maven Installation
    - Docker Installation
  - Ansible Master
    - SSH Keys
    - Ansible Installation
  - SonarQube Server
    - SonarQube Installation
  - KOPS
    - K8s Cluster Create it and update it.


Required Tools and Settings:
----------------------------

- Git Hub Integration
  - Integrate the Jenkins with GitHub (Maven-Java-Project) Project

- Ansible Settings
  - Install the ansible package on 'Ansible Master' Node
  - Configure SSH 'Password less login' bet Master and Target Nodes (Build Server & SonarQube)
  - Define the Inventory file with Target Nodes IPs in hosts file

- Maven Settings
  - Install the Maven on Build Server
  - Setup Maven tool in Jenkins Tool Configuration Section

- Docker Settings
  - Install Docker Tool on Build Server with Ansible Playbook
  - Create Docker Repository on Docker Hub
  - Create a Credential with Docker Hub UN and PWD in jenkins

- SonarQube Settings
  - Install SonarQube tool on SonarQube Server using Ansible Playbook
  - Create Project in the SonarQube Server
      - Project Name
      - Generate Token
  - Install Sonarscanner plugin
  - Create a secret text in Jenkins credentials section
  - Add the Sonar Server Details in the Configure Section

- Kubernetes Settings
  - Setup Name Spaces in K8s-Cluster for Staging and Prod environments
