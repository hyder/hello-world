pipeline {
  agent any
  tools {
    gradle 'gradle'
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
        sh 'docker build -f Dockerfile.build -t helloworld .'        
      }
    }
    stage('Build Image') {
        agent any
        steps {
          sh 'pwd'
        //  sh 'docker build -f Dockerfile.build -t helloworld .'
        }
    }        
  }
}
