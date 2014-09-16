#Docker phpservermon

+ Edit the initdatabase.sh file to set the variables for your database name, username, and password 
+ Include a tarred copy of phpservermon in your directory
+ Build docker image using the Dockerfile



    `docker build --tag="phpservermon" .`


+ Start up the docker container and bind port 80 to your local system
    You can also export the database from /var/lib/mysql. This will allow future instances to use the database created by this container.

    `docker run -p 80:80 -v /var/lib/mysql -i -t phpservermon bash`

+ On the first run of the initial container use `/opt/initdatabase.sh` to create the database necessary for phpservermon

+ `/opt/startup.sh` will start the necessary services for phpservermon

+ You will now have a new instance of phpservermon available at http://hostip/phpservermon
