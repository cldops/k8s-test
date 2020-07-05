pipeline {
  environment {
    registry = 'cldops/fptnginx'
    registryCredential = 'jenkins-dockerhub'
    app = ''
  }

  agent any
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
          docker.withRegistry( '', registryCredential ) {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }
      }
    }

    stage('deploy image'){
      steps{
        sh "chmod +x modifytag.sh"
        sh "./modifytag.sh $BUILD_NUMBER"
//        sh "./modifytag.sh 10"
        sshagent(['kops']) {
          sh "scp -o StrictHostKeyChecking=no service.yml deploy.yml centos@100.25.37.71:/home/centos/mysetup/"
//          sh "scp -o StrictHostKeyChecking=no service.yml deploy.yml root@100.25.37.71:/root/mysetup/"
          script {
            sh "ssh centos@100.25.37.71 kubectl apply -f /home/centos/mysetup/."
//            sh "ssh centos@100.25.37.71 kubectl set selector svc/blue-green-svc color=green"
//            sh "ssh root@100.25.37.71 kubectl apply -f /root/mysetup/."
//            sh "ssh root@100.25.37.71 kubectl set selector svc/blue-green-svc color=green"
          }
        }
      }
    }

    stage('remove image from local') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }

  }
}

