docker build -t filipebsouza/multi-client:latest -t filipebsouza/multi-client:$SHA -f ./complex/client/Dockerfile ./complex/client
docker build -t filipebsouza/multi-server:latest -t filipebsouza/multi-server:$SHA -f ./complex/server/Dockerfile ./complex/server
docker build -t filipebsouza/multi-worker:latest -t filipebsouza/multi-worker:$SHA -f ./complex/worker/Dockerfile ./complex/worker

docker push filipebsouza/multi-client:latest
docker push filipebsouza/multi-server:latest
docker push filipebsouza/multi-worker:latest

docker push filipebsouza/multi-client:$SHA
docker push filipebsouza/multi-server:$SHA
docker push filipebsouza/multi-worker:$SHA

kubectl apply -f ./complex/k8s
kubectl set image deployments/server-deployment server=filipebsouza/multi-server:$SHA
kubectl set image deployments/client-deployment client=filipebsouza/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=filipebsouza/multi-worker:$SHA
