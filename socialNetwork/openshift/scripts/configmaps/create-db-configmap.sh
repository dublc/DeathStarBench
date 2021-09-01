#!/bin/bash

cd /home/master/Desktop/tuning/kubernetes

kubectl create configmap mongodb-config --from-file=config/mongod.conf -n social-network
kubectl apply -f config/memcached-configmap.yaml -n social-network