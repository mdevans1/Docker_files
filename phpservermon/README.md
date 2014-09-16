Build docker image using the Dockerfile
Include a tarred copy of phpservermon in your directory

On the first run of the initial container use /opt/initdatabase.sh to create the database necessary for phpservermon

/opt/startup.sh will start the necessary services for phpservermon

