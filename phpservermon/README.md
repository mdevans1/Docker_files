#Docker phpservermon

1. Edit the initdatabase.sh file to set the variables for your database name, username, and password 

2. Build docker image using the Dockerfile
Include a tarred copy of phpservermon in your directory

`docker build --tag="phpservermon" .`


3. Start up the docker container and bind port 80 to your local system
You can also export the database from /var/lib/mysql. This will allow future instances to use the database created by this container.

`docker run -p 80:80 -v /var/lib/mysql -i -t phpservermon bash`

4. On the first run of the initial container use /opt/initdatabase.sh to create the database necessary for phpservermon

5. /opt/startup.sh will start the necessary services for phpservermon

6. You will now have a new instance of phpservermon available at http://hostip/phpservermon
