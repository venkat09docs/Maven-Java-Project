def mvnHome
def remote = [:]
    	remote.name = 'deploy'
    	remote.host = '192.168.33.2'
    	remote.user = 'root'
    	remote.password = 'vagrant'
    	remote.allowAnyHosts = true
pipeline {
    
	agent none
	
	stages {
		//def mvnHome
		stage ('Preparation') {
		    agent {
		        label 'master'
		    }
		    steps {
			    git 'https://github.com/venkat09docs/Maven-Java-Project.git'
			    stash 'Source'
			    script{
			        mvnHome = tool 'Maven3.6'
			    }
		    }
		}
		stage ('build'){
			agent {
				label "master"
            }
			steps {
				sh "'${mvnHome}/bin/mvn' clean package"			
			}
			post {
                always {
                    junit 'target/surefire-reports/*.xml'
                    archiveArtifacts '**/*.war'
                    fingerprint '**/*.war'
                }
            }
		}
		stage('Deploy-to-Stage') {
		     agent {
		        label 'master'
		    }
		    //SSH-Steps-Plugin should be installed
		    //SCP-Publisher Plugin (Optional)
		    steps {
		        //sshScript remote: remote, script: "abc.sh"  	
			sshPut remote: remote, from: 'target/java-maven-1.0.war', into: '/root/tomcat8/webapps'		        
		    }
    	}
    	stage ('Integration-Test') {
			agent {
				label "master"
            }
			steps {
				parallel (
					'integration': { 
						unstash 'Source'
						sh "'${mvnHome}/bin/mvn' clean verify"
      							  						
					}, 'quality': {
						unstash 'Source'
						sh "'${mvnHome}/bin/mvn' clean test"
					}
				)
			}
		}
		stage ('approve') {
			agent {
				label "master"
            }
			steps {
				timeout(time: 7, unit: 'DAYS') {
					input message: 'Do you want to deploy?', submitter: 'admin'
				}
			}
		}
		stage ('Prod-Deploy') {
			agent {
				label "master"
            }
			steps {
				unstash 'Source'
				sh "'${mvnHome}/bin/mvn' clean package"				
			}
			post {
				always {
					archiveArtifacts '**/*.war'
				}
			}
		}
    	
	}	
}
