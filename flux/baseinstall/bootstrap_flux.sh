#!/bin/bash

# Split up the CRDs
flux install --export | yq eval 'select(.kind == "CustomResourceDefinition")' > flux-crds.yaml
flux install --export | yq eval 'select(.kind != "CustomResourceDefinition")' > flux-system.yaml

# Install flux CRDs
kubectl apply -f flux-crds.yaml
kubectl apply -f flux-system.yaml
kubectl apply -f flux-config.yaml

# Install flux Kustomization


