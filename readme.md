**Docker Multi-Stage Pipeline**

Overview
This project leverages Docker Multi-Stage builds and GitHub Actions to automate the daily build and deployment of our website code. The pipeline runs scheduled tasks every day during non-business hours, ensuring the application remains up-to-date without impacting production operations. The latest Docker image is pushed to Docker Hub for easy distribution and deployment.

https://github.com/iam-siva-prasad/Play-With-Docker/blob/main/Repo-Images/Git%20%E2%86%92%20GitHub%20Actions%20%E2%86%92%20Scheduled%20%E2%86%92%20Docker%20%E2%86%92%20Docker%20Hub.png 
raw=true

**Key Features**

**Automated Daily Builds**

Uses GitHub Actions to build the application image every day.


**Multi-Stage Docker Builds**

Optimizes image size and enhances security by separating build and runtime stages.


**Push to Docker Hub**

Publishes the latest image to Docker Hub for seamless deployment.


**Scheduled Execution During Off-Hours**

Runs outside business hours to minimize downtime and avoid service disruption.


**Business Impact**

By implementing this pipeline, we:

Reduce the risk of downtime for web services.
Maintain consistent and reliable deployments.
Improve operational efficiency.
Ensure updates happen seamlessly outside of peak business hours.


Workflow Highlights

**Trigger Types:**


Daily schedule at 11:00 AM IST (05:30 UTC).
On every push to the main branch.
Manual trigger via workflow_dispatch.


**Stages:**


Build: Creates Docker image using multi-stage build.
Test: Runs container and validates application health.
Push: Tags and pushes image to Docker Hub.




**Technologies Used**

Docker (Multi-Stage Builds)
GitHub Actions (CI/CD Automation)
Docker Hub (Image Registry)





