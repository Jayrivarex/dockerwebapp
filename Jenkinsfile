pipeline{

	agent {}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/jayrivarez/dockerwebapp'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t jayrivarex/node:carbon-alpine .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push jayrivarex/node:carbon-alpine'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}