# API Discovery Java Spring Boot v2 Petstore Demo

This is a demo of using API Discovery with a Java Spring Boot v2 project. The CI/CD pipeline is configured to perform the following actions:

- Build the project using maven
- Run API Discovery against the build output (an executable jar)
- Publish the project to the GitLab container registry
- Run DAST API against the running service to test for security issues
