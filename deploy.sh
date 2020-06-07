docker build -t lbrf/multi-client:latest -t lbrf/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lbrf/multi-server:latest -t lbrf/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lbrf/multi-worker:latest -t lbrf/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push lbrf/multi-client:latest
docker push lbrf/multi-server:latest
docker push lbrf/multi-worker:latest
docker push lbrf/multi-client:$SHA
docker push lbrf/multi-server:$SHA
docker push lbrf/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lbrf/multi-server:$SHA
kubectl set image deployments/client-deployment server=lbrf/multi-client:$SHA
kubectl set image deployments/worker-deployment server=lbrf/multi-worker:$SHA