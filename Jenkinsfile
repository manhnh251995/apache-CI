pipeline {
    agent none
    environment {
      IMAGE = 'apache'
      REGISTRY_PASS = credentials("docker-registry-pass")
      TAG_IMAGE = 'prod'
    }
    stages {
        stage('Build'){
          agent { label 'master'}
          steps {
            sh'''
            docker build -t $IMAGE:$TAG_IMAGE-$BUILD_ID .
            '''
          }
       }
    }
}
