# Fibanocci Series Generator

This is a sample fibanocci series generator app written this Python.
The repo has all the necessary files to build and deploy the app.

## Usage

This app is accessible at https://app.fibanocci.info/?n=your_number
for example: https://app.fibanocci.info/?n=2 outputs 0,1

You can generate fibanocci series till nth number using the url, by changing n each time.
It will simply display a 422 error if a negative integer is passed for n.

## Build and Deploy

All the configuration to build to the application into a dockerfile is in jenkins/jenkinsfile.
It's configured to build the docker image and deploy in GKE when a PR is merged to main branch.
I uses a multibranch pipeline for the entire CI/CD process.

## Deploy Instructions

1. If you are using Jenkins for CI/CD, you just need to add the repo to SCM in a multi-branch pipeline - that's it.
2. If you wanna deploy manually, clone the repo `git clone https://github.com/devopsalekhya/fibanocci-app.git`
3. Build the docker image and push it to a container registry `docker build -t image:tag .` and `docker push container/registry/prefix/image:tag`
4. Create a kubernetes cluster and apply the manifest files `kubectl apply manifests/<manifest.yml>`
5. The service automatically creates a Network Endpoint Group (NEG).
6. Attach NEGs to a global LB. Refer: `gcloud compute url-maps` `gcloud compute-http-proxies` `gcloud compute forwarding-rules`
7. You should be able to acceess the application using the LB IP address.


