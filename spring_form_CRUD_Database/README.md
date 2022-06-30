
**FORM BASED CRUD WEBAPP**

**Project Title**: spring_form_CRUD_Database

**Project Description:** This project was done to practice crud operation through a spring framework based webapp. A user can add location name, create user giving user details, upload user photo or files and can see both user list and location list from the client side. Other than Spring framework, commons fileupload dependency was used to deal with file upload process and postgresql docker image is used as database. At the end, this project is containerized using docker and can be run by docker compose.

**To run this project:** sudo docker-compose up 

**Things to do before creating Dockerfile:** 
    
- update Url, Username, Password of  hbm.cfg.xml file
- mvn clean install

**DOCKER COMMANDS:**

Images:
    
- To create Image: Change directory to dockerfile location. [sudo docker build -t <image_name:tag> .]
- To see images: [sudo docker images]
- To remove image: [sudo docker rmi <img_id>]
- To remove all images: [sudo docker image rm -f $(docker image ls -q)]

Containers:

- To create and run Container: [sudo docker run -it <img_id>]
- To start Container: [sudo docker start <container_id>]
- To run command inside container shell: [ sudo docker exec -it <container_id> /bin/bash]
- To stop Container: [ sudo docker stop <container_id>]
- To see all containers: [ sudo docker ps -a]
- To remove all containers : [ sudo docker system prune] or [sudo docker container rm -f $(docker container ls -aq)]

Docker-Compose:

- To run docker compose file: [docker compose up]