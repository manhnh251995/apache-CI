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
                docker tag $IMAGE:$TAG_IMAGE-$BUILD_ID manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                docker push manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                '''
            }
        }
        stage('deploy to stagging '){
            agent { label 'jenkin02' }
            steps {
                sh'''
                docker login -u manhnh1995 -p $REGISTRY_PASS
                docker push manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                docker run -itd -p 8888:80 manhnh1995/$IMAGE:$TAG_IMAGE-$BUILD_ID
                '''
            }
        }
    }
}
