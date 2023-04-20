docker build --tag fenio/mvn-awscliv2 .
docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker push fenio/mvn-awscliv2