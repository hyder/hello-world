pipeline {
  agent any
  tools {
    gradle 'gradle6'
  }
  stages {
    stage('Source') { // Get code
      steps {
        // get code from our Git repository
        git 'https://github.com/hyder/hello-world.git'
      }
    }
    stage('CompileAndTest') { // Compile and do unit testing
      steps {
        // run Gradle to execute compile and unit testing
        sh 'gradle clean compileJava test'
      }
    }
    stage('Package') { // Compile and do unit testing
      steps {
        // run Gradle to do packaging
        sh 'gradle assemble'
      }
    }
    stage('Dockerize') { // Compile and do unit testing
      steps {
        sh 'echo $CWD'
      }
    }        
  }
}