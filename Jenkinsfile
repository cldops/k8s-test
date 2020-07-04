pipeline {
  agent any
  environment {
    registry = 'cldops/fptnginx'
//    registryCredential = 'docker-hub'
    app = ''
  }

  stages {

    stage('Build image') {
      steps{
        script{
          app = docker.build(registry + ":$BUILD_NUMBER")
        }
      }
    }

    stage('push image'){
        steps{
          script{
            withCredentials([usernamePassword( credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            docker.withRegistry( '', 'docker-hub' ) {
              sh "docker login -u ${USERNAME} -p ${PASSWORD}"
              app.push("${env.BUILD_NUMBER}")
              app.push("latest")
            }
          }
        }
      }
    }

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

