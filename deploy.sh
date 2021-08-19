docker build -t pruchay/multi-client:latest -t pruchay/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pruchay/multi-server:latest -t pruchay/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pruchay/multi-worker:latest -t pruchay/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push pruchay/multi-client:latest
docker push pruchay/multi-server:latest
docker push pruchay/multi-worker:latest

docker push pruchay/multi-client:$SHA
docker push pruchay/multi-server:$SHA
docker push pruchay/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=pruchay/multi-server:$SHA
kubectl set image deployments/client-deployment client=pruchay/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=pruchay/multi-worker:$SHA
