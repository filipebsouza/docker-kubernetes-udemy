kind delete cluster
kind create cluster --config=kind-cluster-config.yaml --name=main
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml
kubectl get all -n kubernetes-dashboard