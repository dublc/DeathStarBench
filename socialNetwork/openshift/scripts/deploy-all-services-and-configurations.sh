#!/bin/bash

cd $(dirname $0)/..
NS="social-network"

kubectl create namespace ${NS}
# kubectl adm policy add-scc-to-user anyuid -z default -n ${NS}
# kubectl adm policy add-scc-to-user privileged -z default -n ${NS}

./scripts/create-all-configmap.sh 

# The following script optionally creates lkubectlal dkubectlker images suitable for lkubectlal customization.
# ./scripts/build-dkubectlker-img.sh

for service in *.yaml ;  do
  kubectl apply -f $service -n ${NS}
done

kubectl expose service nginx-thrift -n ${NS}
kubectl expose service jaeger-out -n ${NS}

echo "After all pods are running (kubectl get pods):"
echo "Follow the instructions in openshift/README.md to configure and run init_skubectlial_graph.py to load the dataset."

cd - >/dev/null
