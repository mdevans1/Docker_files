#Docker phpservermon

+ Edit the initdatabase.sh file to set the variables for your database name, username, and password 
+ Include phpservermon.tar.gz in your directory (http://www.phpservermonitor.org/download/)
+ Build docker image using the Dockerfile



    `docker build --tag="phpservermon" .`


+ Start up the docker container and bind port 80 to your local system
    You can also export the database from /var/lib/mysql. This will allow future instances to use the database created by this container.

    `docker run -p 80:80 -v /var/lib/mysql -i -t phpservermon bash`

+ On the first run of the initial container use `/opt/initdatabase.sh` to create the database necessary for phpservermon

+ `/opt/startup.sh` will start the necessary services for phpservermon

+ You will now have a new instance of phpservermon available at http://hostip/phpservermon

+ In the instance that you end up stopping the original container. You can run an image and mount the sql data from the original container using the following commands

    + locate the Container ID of the original image
       
        ```
        docker ps -a
        CONTAINER ID
        1c674c6ef6aa        phpservermon:latest
        ```
    
    + Start the phpservermon image and mount the volume from the original container

        `sudo docker run -p 80:80 -i -t --volumes-from 1c674c6ef6aa phpservermon /bin/bash`
    
    + `/opt/startup.sh` will start the necessary services for phpservermon
