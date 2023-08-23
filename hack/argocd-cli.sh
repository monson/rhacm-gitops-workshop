oc create route passthrough argocd --service=argocd-server --port=https --insecure-policy=Redirect
echo https://$(oc get routes argocd -o=jsonpath='{ .spec.host }')

# Reference: https://cloud.redhat.com/blog/openshift-authentication-integration-with-argocd