ci_build_image := "jamwaffles/circleci-embedded-graphics:1.57.0-0"

#--------
# Docker
#--------

# Generate the Docker image used by the CI pipeline
build-ci-image:
    docker build -t "{{ci_build_image}}" -f ./docker/Dockerfile --compress .

# Push the generated CI build environment image to Docker Hub
push-ci-image:
    docker push "{{ci_build_image}}"
