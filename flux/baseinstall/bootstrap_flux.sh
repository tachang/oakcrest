#!/bin/bash

# Split up the CRDs
flux install --export | yq eval 'select(.kind == "CustomResourceDefinition")' > flux-crds.yaml
flux install --export | yq eval 'select(.kind != "CustomResourceDefinition")' > flux-system.yaml

# Install flux CRDs

# Install flux Kustomization


