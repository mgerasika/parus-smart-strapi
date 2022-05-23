#for local testing/or local docker container
image=docker-parus-smart-strapi2
container=docker-parus-smart-strapi2
port=3134
#should coming from git commit hash
version=1

docker stop $container
docker image rm $image
docker rm $container
docker build -t $image -f Dockerfile . --build-arg REACT_APP_VERSION=$version
docker run --env PORT=1337 -d -p $port:1337 --env-file=.env --env DATABASE_HOST=host.docker.internal --name $container $image

# docker pull strapi/strapi
# docker run -it \
#   -e DATABASE_CLIENT=postgres \
#   -e DATABASE_NAME=strapi \
#   -e DATABASE_HOST=0.0.0.0 \
#   -e DATABASE_PORT=5432 \
#   -e DATABASE_USERNAME=strapi \
#   -e DATABASE_PASSWORD=strapi \
#   -p 1337:1337 \
#   -v `pwd`/project-name:/srv/app \
#   strapi/strapi
