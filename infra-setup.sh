#!/bin/bash

####################
# Minikube Startup #
####################

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
CLUSTER_NAME="infra-cluster-free"
DRIVER="docker"
CPUS="2"
MEMORY="4096"

# Check if minikube is installed
if ! command -v minikube &> /dev/null
then
    echo "minikube could not be found. Install minikube first"
    exit 1
fi

# Check if kubectl is installed
if command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Install kubectl first"
    exit 1
fi

# Start Minikube cluster
echo "Creating local kubernetes cluster using Minikube.."
minkube start --driver=$DRIVER --cpus=$CPUS --memory=$MEMORY --profile=$CLUSTER_NAME

# Enable necessary addons
echo "Enabling necessary addons.."
minikube addons enable ingress --profile=$CLUSTER_NAME
minikube addons enable metrics-server --profile=$CLUSTER_NAME

# Verify cluster creation
echo "Verying cluster creation.."
kubectl get nodes

# Display cluster info
echo "Cluster setup complete. Here's your cluster information:"
minikube  status --profile=$CLUSTER_NAME

echo "You can now use 'kubectl' to interact with your cluster."
echo "To use this cluster, run: 'minikube profile $CLUSTER_NAME'"
echo "To access the Kubernetes dashboard, run: 'minikube dashboard --profile=$CLUSTER_NAME'"

###########
# Argo CD #
###########

kubectl create namespace schemahero

helm repo add schemahero https://schemahero.io
helm repo update

helm upgrade --install schemahero schemahero/schemahero \
    --namespace schemahero \
    --wait

