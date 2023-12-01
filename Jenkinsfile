pipeline{
    agent any
    
    stages{
        stage(" Clone Code"){
            steps{
                echo "Cloning the code"
                git url: "https://github.com/NayakTapan/Larave-test-app.git", branch: "main"
            }
        }
        stage("build"){
            steps{
                echo "building the image"
                sh "docker build -t laravel-app ."
            }
        }
        stage("puch to Docker Hub"){
            steps{
                echo "pushing the image to docker hub"
            }
        }
        stage("Deploye"){
            steps{
                echo "Deploy the container"
                sh "docker run -d -p 8000:8000 laravel-app"
            }
        }
    }
}