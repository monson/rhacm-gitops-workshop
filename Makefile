all: pull-vault pull-external-secrets

pull-vault:
	rm -rf resources/secret-management/vault-server/chart
	helm repo add hashicorp https://helm.releases.hashicorp.com || true
	helm pull hashicorp/vault  --untar --untardir=resources/secret-management/vault-server
	mv resources/secret-management/vault-server/vault resources/secret-management/vault-server/chart
	helm template vault-server  resources/secret-management/vault-server/chart -f resources/secret-management/vault-server/override-values.yaml  --namespace vault > resources/secret-management/vault-server/all-in-one-template.yaml
	# helm template vault-server  resources/secret-management/vault-server/chart -f resources/secret-management/vault-server/override-ha-values.yaml  --namespace vault > resources/secret-management/vault-server/all-in-one-template.yaml


pull-external-secrets:
	rm -rf resources/secret-management/external-secrets/chart
	helm repo add external-secrets https://external-secrets.github.io/kubernetes-external-secrets/ || true
	helm pull external-secrets/external-secrets --untar --untardir=resources/secret-management/external-secrets/
	mv resources/secret-management/external-secrets/external-secrets resources/secret-management/external-secrets/chart
	helm template external-secrets resources/secret-management/external-secrets/chart -f resources/secret-management/external-secrets/override-values.yaml --namespace external-secrets > resources/secret-management/external-secrets/all-in-one-template.yaml
