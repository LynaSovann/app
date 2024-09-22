# Jenkinsfile explanation

## Pipeline Configuration 

The pipeline configuration in the `Jenkinsfile` specifies the following stages: 

1. **Checkout**: Check if the job is running in which node. 
   - Remove all the images which don't run at any container
     ```
     docker image prune --all
     ```
2. **Clean package**
3. **build and push docker image**
4. **Cloning the manifest file**
5. **Updating the manifest file**
6. **push changes to the manifest**
