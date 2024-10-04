# idp_demo

The repository includes configurations and manifests for setting up an IDP, showcasing integrations with tools like ArgoCD, Crossplane, and others.

## Overview

This project showcases how to set up an IDP by leveraging cloud-native tools and practices. The demo includes infrastructure setup, application deployment, resource management, policy enforcement, database schema management, and secret management.

For this IDP I wanted to focus on:

1. Standardized deployment process
2. Provide easy-to-use service templates
3. Centralized monitoring and logging

### Key Components

- [x] ~~Infrastructure: EKS cluster using 'eksctl'~~
- [x] Application DEployment: Managed by ArgoCD
- [ ] Cloud Resources: Managed by Crossplane
- [ ] Policies: Enforced using OPA(Open Policy Agency)
- [ ] Database Management: Using SchemaHero
- [ ] Secret Management: Using External Secrets Operator
- [ ] CI/CD: Automated with GitHub Actions

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
