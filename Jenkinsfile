node {
    checkout scm

    docker.withRegistry('https://hub.docker.com/u/jayrivarex', 'dockerHub') {

        def customImage = docker.build("jayrivarez/dockerwebapp")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}