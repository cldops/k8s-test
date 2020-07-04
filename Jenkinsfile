pipeline {
  agent any
  environment {
    registry = 'cldops/infrrd'
    registryCredential = 'docker-hub'
    app = ''
  }

  stages {

    stage('Build image') {
      steps{
        script{
          app = docker.build(--no-cache registry + ":$BUILD_NUMBER")
        }
      }
    }

/*    stage('push image'){
        steps{
          script{
            docker.withRegistry( '', registryCredential ) {
              app.push("${env.BUILD_NUMBER}")
              app.push("latest")
            }
          }
        }
    }*/

/*    stage('deploy image'){
      steps{
        sh "chmod +x modifytag.sh"
        sh "./modifytag.sh $BUILD_NUMBER"
        sshagent(['local-k8s']) {
          sh "scp -o StrictHostKeyChecking=no service.yml deploy.yml kadmin@192.168.7.123:/home/kadmin/infrrd/"
          script {
            sh "ssh kadmin@192.168.7.123 kubectl apply -f /home/kadmin/infrrd/."
          }
        }
      }
    }*/

  }
}

