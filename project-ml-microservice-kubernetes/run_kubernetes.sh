#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# This is your Docker ID/path
dockerpath=wallyt/theapp

# Run the Docker Hub container with kubernetes
kubectl run kubernetes-theapp --image=$dockerpath --port=80 --labels="app=theapp"

# List kubernetes pods
kubectl get pods

POD=$(kubectl get pods -l app=theapp -o custom-columns=:metadata.name)

a="Waiting for pod "
b="$a$POD"
echo $b
sleep 600

# Forward the container port to a host
kubectl port-forward $POD 80:80
