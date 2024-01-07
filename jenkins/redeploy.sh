gcloud container clusters get-credentials fibanocci-cluster --region us-central1 --project seventh-voltage-410418 --impersonate-service-account platform-interview@seventh-voltage-410418.iam.gserviceaccount.com
kubectl patch deployment 	fibanocci -n fibanocci -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"build\":\"${BUILD_ID}\"}}}}}"
