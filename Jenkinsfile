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
        stage('Push to registry'){
            agent { label 'master' }
            steps {
                sh'''
                docker login -u manhnh1995 -p $REGISTRY_PASS
                docker tag -t $IMAGE:$TAG_IMAGE-$BUILD_ID manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                docker push manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                '''
            }
        }
    }
}
