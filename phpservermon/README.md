Build docker image using the Dockerfile
Include a tarred copy of phpservermon in your directory
`docker build --tag="phpservermon" .`


Start up the docker container and bind port 80 to your local system
You can also export the database from /var/lib/mysql. This will allow future instances to use the database created by this container.
`docker run -p 80:80 -v /var/lib/mysql phpservermon`

On the first run of the initial container use /opt/initdatabase.sh to create the database necessary for phpservermon

/opt/startup.sh will start the necessary services for phpservermon

