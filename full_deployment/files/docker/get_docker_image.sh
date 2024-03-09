#!/bin/bash


# Check if the correct number of arguments provided
if [ "$#" -ne 1 ]; then
	echo "Usage: get_docker_image.sh [password]"
	exit 1
fi


# Initialize Variables
artifactory_url="http://tomer-jfrog.octopus.lab/artifactory"
password=$1
username="admin"
repository="flask"
image_name="helloapi-image:1"


# Check the connection to the artifactory is valid
response_code=$(curl -u $username:$password -s -o /dev/null -w "%{http_code}" "$artifactory_url/$repository/")

if [[ "$response_code" != "200" ]]; then
	echo "Error: credentials provided are not valid."
	exit 1
fi


# Check if the image exists in the artifactory
artifactory_list=$(curl -X GET -u $username:$password "$artifactory_url/$repository/")

if [[ $artifactory_list != *"$image_name"* ]]; then
	echo "Error: Could not locate docker image"
	exit 1
fi


# Download the docker image
echo "Downloading Docker image..."
curl -u $username:$password -L "$artifactory_url/$repository/$image_name" -o "$image_name"
docker load -i "$image_name"

