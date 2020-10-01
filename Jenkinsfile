def remote = [:]
         remote.name = 'ansible'
         remote.host = '172.31.30.154'
         remote.user = 'centos'
         remote.password = 'Rnstech@123'
         remote.allowAnyHosts = true
pipeline {
    agent { label 'buildserver'}

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3.6"
    }

    stages {
        stage('Prepare-Workspace') {
            steps {
                // Get some code from a GitHub repository
                git credentialsId: 'github-server-credentials', url: 'https://github.com/venkat09docs/Maven-Java-Project.git'                
            }
            
        }
        stage('Tools-Setup') {
            steps {
                sshCommand remote: remote, command: 'cd Maven-Java-Project; git pull'
                sshCommand remote: remote, command: 'cd Maven-Java-Project; ansible-playbook -i hosts tools/sonarqube/sonar-install.yaml'
                sshCommand remote: remote, command: 'cd Maven-Java-Project; ansible-playbook -i hosts tools/docker/docker-install.yml'   
            }
            
        }
    }
}
