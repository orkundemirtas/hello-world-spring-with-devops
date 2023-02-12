node {
    def WORKSPACE = 'D:\\JenkinsWorkspace\\springboot'
    def dockerImageTag = "springboot-deploy${env.BUILD_NUMBER}"

    try{
//          notifyBuild('STARTED')
         stage('Clone Repo') {
            // for display purposes
            // Get some code from a GitHub repository
            git url: 'https://github.com/orkundemirtas/hello-world-spring-with-devops.git',
                credentialsId: 'orkundemirtas',
                branch: 'main'
         }
          stage('Build docker') {
                 dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
          }

          stage('Deploy docker'){
                  echo "Docker Image Tag Name: ${dockerImageTag}"
                  docker run --name springboot-deploy -d -p 8081:8081 springboot-deploy:${env.BUILD_NUMBER}
          }
    }catch(e){
//         currentBuild.result = "FAILED"
        throw e
    }finally{
//         notifyBuild(currentBuild.result)
    }
}
