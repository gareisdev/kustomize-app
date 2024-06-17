create-cluster:
	@kind create cluster --config=kind-config.yaml
	@helm repo add cilium https://helm.cilium.io/
	@helm install cilium cilium/cilium --version 1.15.6 \
		--namespace kube-system \
		--set image.pullPolicy=IfNotPresent \
		--set ipam.mode=kubernetes

delete-cluster:
	@kind delete cluster --name local-cluster

build:
	@docker build -t mypodinfo:v1.0.0 .

run: build
	@docker run -it -p 8080:80 mypodinfo:v1.0.0 -d

publish: build
	@kind load docker-image mypodinfo:v1.0.0 --name local-cluster

