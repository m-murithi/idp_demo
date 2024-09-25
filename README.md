# idp_demo

The repository includes configurations and manifests for setting up an IDP, showcasing integrations with tools like ArgoCD, Crossplane, and others.

## Overview

This project showcases how to set up an IDP by leveraging cloud-native tools and practices. The demo includes infrastructure setup, application deployment, resource management, policy enforcement, database schema management, and secret management.

### Key Components

1. [  ] Infrastructure: EKS cluster using 'eksctl'
2. [  ] Application DEployment: Managed by ArgoCD
3. [  ] Cloud Resources: Managed by Crossplane
4. [  ] Policies: Enforced using OPA(Open Policy Agency)
5. [  ] Database Management: Using SchemaHero
6. [  ] Secret Management: Using External Secrets Operator
7. [  ] CI/CD: Automated with GitHub Actions

### Project Structure

```plaintext
idp-demo/
├── apps/
│   └── demo-app.yaml
├── argocd/
│   └── application.yaml
├── crossplane/
│   └── provider.yaml
├── crossplane-config/
│   └── aws.yaml
├── eso/
│   └── secret.yaml
├── infra/
│   └── eksctl-config.yaml
├── policies/
│   └── opa-policy.rego
├── schema-hero/
│   └── database.yaml
├── .github/
│   └── workflows/
│       └── deploy.yaml
├── setup.sh
├── setup-infra.sh
├── setup-previews.sh
└── destroy.sh
```

### Usage

- To Create and Manage the infrastrucutre, use the provided setup scripts
- Deploy applications and manage resources using the manifests and configurations
- Use GitHub Actions for CI/CD pipelines

### Cleanup

- To tear down the setup and clean up resources, run:

```bash
./destroy.sh
```
