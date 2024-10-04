#!/bin/bash

# Function to update YAML file
update_yaml() {
    local file=$1
    local key=$2
    local value=$3
    yq --inplace "$key = \"$value\"" "$file"
}

# Main Function
create_argocd_app() {
    local name=$1
    local repo_org=$2
    local repo_name=$3
    local environment=$4
    
    local file_path="apps/${name}-${environment}.yaml"
    local template_path="argocd/app-template.yaml"
    local repo_url="https://github.com/${repo_org}/${repo_name}.git"
    local kustomize_path="kustomize/overlays/${environment}"

    # Copy template
    cp "$template_path" "$file_path"

    # Update YAML
    update_yaml "$file_path" ".metadata.name" "$name"
    update_yaml "$file_path" ".spec.source.repoURL" "$repo_url"
    update_yaml "$file_path" ".spec.source.path" "$kustomize_path"
    update_yaml "$file_path" ".spec.destination.namespace" "$environment"

    echo "ArgoCD application created at $file_path"
}

# Check if correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <name> <repo_org> <repo_name> <environment>"
    exit 1
fi

# Call main function
create_argocd_app "$1" "$2" "$3" "$4"