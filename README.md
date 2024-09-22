# Jenkinsfile explanation

## Pipeline Configuration 

The pipeline configuration in the `Jenkinsfile` specifies the following stages: 

1. **Checkout**: Check if the job is running in which node. 
   - Remove all the images which don't run at any container

     ```
     docker image prune --all
     ```
2. **Clean package**: clean all generated file 
3. **build and push docker image**: Build the image with new tag and push to docker registry 
   - Login to the dockerhub account
   
     ```
     withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                      sh 'echo "${DOCKER_PASS} ${DOCKER_USER}" '
                      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    }
    ```

4. **Cloning the manifest file**
5. **Updating the manifest file**
6. **push changes to the manifest**
