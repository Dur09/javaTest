node {
	stage('clean and checkout'){
		sh '''
			docker ps -l | grep java-local
			docker stop java-local
			docker rm java-local
		'''
	}
	stage('Build image'){
        	sh 'docker build -t docker:java .'
	}
	stage('Build container'){
        	sh 'docker run -it -e "container=docker" --privileged=true -d --security-opt seccomp:unconfined --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 10443:10443 -h docker-test.example.com --name java-local docker:java  bash -c "/sbin/init"'
		sh 'docker cp -a $PWD/. jsrw-local:/site/javaTest'
	}
	stage('Compilation'){
        	sh 'javac HelloWorld.java'
	}
	stage('Run Java Program'){
        	sh 'java HelloWorld'
   	}
}
