pipeline {
  agent {
    label 'docker'   
    }
  tools {
    maven "mymaven"

    }
 stages{ 

  stage('Checkout code') {
    steps {
      //Get the code from github
      git 'https://github.com/mpakeeru/SimpleTomcatWebapp.git'
    }

   } 
  stage('Build and Test') {
    steps {
      // Build by using maven
      sh "mvn -Dmaven.test.failure.ignore=true clean install package test"
    }

   } 
 // stage('Static Code Analysis') {
   //  environment {
     //   SONAR_URL = "http://192.168.86.36:9000/"
     // }
    //static code analysis using sonar qube
   // steps {
 // withCredentials([usernamePassword(credentialsId: 'sonar', passwordVariable: 'SONAR_PASSWD', usernameVariable: 'SONAR_USER')]) {
    // some block
     //  sh 'mvn sonar:sonar -Dsonar.login=$SONAR_USER -Dsonar.password=$SONAR_PASSWD  -Dsonar.host.url=${SONAR_URL}'
//}
  //  } 

  // } 
  stage('Build and Push Docker Image') {
    // Bild Docker Image
    steps {
       git 'https://github.com/mpakeeru/jenkins-pipeline.git'
        sh "docker build -t myapp1 ."
       sh "docker tag myapp1:latest mamathasama/myapp1:latest"
      // push docker image
       withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWD', usernameVariable: 'DOCKER_USER')]) {
    sh "docker login -u ${env.DOCKER_USER} -p ${env.DOCKER_PASSWD} docker.io"
   sh "docker push mamathasama/myapp1:latest"
}
    }


   } 
 
  stage('Deploy') {
     //deploy
    steps {
      sh "kubectl apply myapp1-deployment.yml,myapp1-service.yml"
  
     }


   } 
}

}
