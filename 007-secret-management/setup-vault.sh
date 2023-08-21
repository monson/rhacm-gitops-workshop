oc exec -ti vault-server-0 -- vault operator init
oc exec -ti vault-server-0 -- vault operator unseal
oc exec -ti vault-server-1 -- vault operator raft join http://vault-server-0.vault-server-internal:8200
oc exec -ti vault-server-1 -- vault operator unseal
oc exec -ti vault-server-2 -- vault operator raft join http://vault-server-0.vault-server-internal:8200
oc exec -ti vault-server-2 -- vault operator unseal

oc exec -ti vault-server-0 -- vault login
oc exec -ti vault-server-0 -- vault operator raft list-peers

oc exec -ti vault-server-0 -- vault secrets enable -path=secret/ kv
oc exec -ti vault-server-0 -- vault kv put secret/openshiftpullsecret dockerconfigjson='{"auths":{"cloud.openshift.com":{"auth":"3BlbnNoaWZ0LXJl==","email":"example@redhat.com"},"quay.io":{"auth":"ZZMVhJRUJUR1I3WUwxN05VMQ==","email":"example@redhat.com"},"registry.connect.redhat.com":{"auth":"3BlbnNoaWZ0LXJl==","email":"example@redhat.com"},"registry.redhat.io":{"auth":"==","email":"example@redhat.com"}}}'

oc create secret generic vault-token --from-literal=token="s.XhitRtJcA8CVT7a9xfK804KT" -n vault 
