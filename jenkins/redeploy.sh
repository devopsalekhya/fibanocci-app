#!/bin/bash

# Authenticate with the cluster
gcloud container clusters get-credentials fibanocci-cluster --region us-central1 --project seventh-voltage-410418 --impersonate-service-account platform-interview@seventh-voltage-410418.iam.gserviceaccount.com

# Patch the deployment with new image
kubectl patch deployment 	fibanocci -n fibanocci -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"build\":\"${BUILD_ID}\"}}}}}"
