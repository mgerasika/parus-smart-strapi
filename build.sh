#for local testing/or local docker container
image=docker-parus-smart-strapi
container=docker-parus-smart-strapi
port=3134
#should coming from git commit hash
version=1

docker stop $container
docker image rm $image
docker rm $container
docker build -t $image -f Dockerfile . --build-arg REACT_APP_VERSION=$version
docker run --env PORT=3137 -d -p $port:3137 --env-file=.env --env DATABASE_HOST=host.docker.internal --name $container $image
