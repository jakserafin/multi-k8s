docker build -t lbrf/multi-client -f ./client/Dockerfile ./client
docker build -t lbrf/multi-server -f ./server/Dockerfile ./server
docker build -t lbrf/multi-worker -f ./worker/Dockerfile ./worker
docker push lbrf/multi-client
docker push lbrf/multi-server
docker push lbrf/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lbrf/multi-server