pipeline {
  agent any
  environment {
    DOCKER_TAG = getDockerTag()
    PWD = getPwd()
  }
  stages {
    stage('test tag') {
      steps{
        sh "echo $DOCKER_TAG"
        sh "echo $PWD"
        sh "docker build -t "cldops/infrrd:${DOCKER_TAG}" $PWD"
      }
    }
  }
}

def getDockerTag(){
  def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag
}

def getPwd(){
  def pwd = sh script: 'pwd', returnStdout: true
  return pwd
}
