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
    - Push the image to Dockerhub
      ```
      docker push ${DOCKER_IMAGE}
      ```
4. **Cloning the manifest file**: 
    - Check if the `manifest-repo` exits. If it exists, we have to remove it first before cloning to avoid conflict directory name. 
    - Clone the manifest file from the other repo in branch `argocd` and assign the name as `manifest-repo`
5. **Updating the manifest file**: Update the manifest file when we build new images. 
   - Update the images line in the manifest file to the new Docker image tag. 
      ```
      sed -i 's|image: ${IMAGE}:.*|image: ${DOCKER_IMAGE}|' ${MANIFEST_REPO}/${MANIFEST_FILE_PATH}
      ```
6. **push changes to the manifest**: commit and push the manifest repo using credential in Jenkins.
