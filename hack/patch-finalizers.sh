
oc patch application/acm-argocd-integration-in-cluster --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/podinfo-sno01 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/podinfo-sno02 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/podinfo-sno03 --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/secret-management-external-secrets  --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/secret-management-external-secrets-vault-config   --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/secret-management-vault-server  --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
oc patch application/advance-cluster-management-in-cluster  --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'