#! /bin/bash
docker build -t phantomskiers/multi-client:latest -t phantomskiers/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t phantomskiers/multi-server:latest -t phantomskiers/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t phantomskiers/multi-worker:latest -t phantomskiers/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push phantomskiers/multi-client:latest
docker push phantomskiers/multi-server:latest
docker push phantomskiers/multi-worker:latest

docker push phantomskiers/multi-client:$SHA
docker push phantomskiers/multi-server:$SHA
docker push phantomskiers/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=phantomskiers/multi-server:$SHA
kubectl set image deployments/client-deployment client=phantomskiers/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=phantomskiers/multi-worker:$SHA
