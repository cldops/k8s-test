pipeline {
  agent any
  environment {
    DOCKER_TAG = getDockerTag()
  }
  stages {
    stage('test tag') {
      steps{
        sh "echo $DOCKER_TAG"
        sh "docker build -t cldops/Infrrd:${DOCKER_TAG} `pwd`"
      }
    }
  }
}

def getDockerTag(){
  def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag
}
