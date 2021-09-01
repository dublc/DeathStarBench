#!/bin/bash

cd $(dirname $0)/../..

kubectl create configmap media-frontend-nginx --from-file=media-frontend-config/nginx.conf  -n social-network
kubectl create configmap media-frontend-lua   --from-file=media-frontend-config/lua-scripts -n social-network
