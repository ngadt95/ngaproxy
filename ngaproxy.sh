#!/bin/sh
command_exists() {
	command -v "$@" > /dev/null 2>&1
}

#Install docker if not exist
if ! command_exists docker; then
    echo "Installing docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    echo "Done"
fi

echo "Starting squid proxy..."
docker run --name squidproxy -d --restart always -p 8886:3128 -e SQUID_USER=ngadt95 -e SQUID_PASS=ngadt95 sportstvdev/squidproxy
echo "Done!"
