# Kustomize App

This is a small FastAPI application that runs in a Kubernetes cluster and provides information about the pod it is running in. The application exposes an endpoint `/podinfo` that returns the pod's name and IP.

## Project content

- **src/**: Contains the FastAPI application source code.
  - `main.py`: Main application code.
- **Dockerfile**: File to build the Docker image for the application.
- **Makefile**: Contains commands to create and delete the cluster, build and publish the Docker image.
- **kind-config.yaml**: Configuration file to create the Kubernetes cluster with Kind and Cilium.
- **kustomize/**: Contains the base and overlays configurations for `kustomize`.
  - **base/**: Base configuration for Deployment and Service.
  - **overlays/**:
    - **development/**: Overlay for the development environment (define 2 replicas).
    - **production/**: Overlay for the production environment (define 6 replicas).

## Prerequisites

- [Docker](https://www.docker.com/)
- [Kind](https://kind.sigs.k8s.io/)
- [Helm](https://helm.sh/)
- [Kustomize](https://kustomize.io/)

## Setup and Deployment

### Create the Cluster

To create the Kubernetes cluster with Kind and Cilium, run the following command:

```sh
make create-cluster
```

### Destroy the cluster

```sh
make delete-cluster
```

### Build the docker image

To build the Docker image for the application, run the following command:

```sh
make build
```

### Run the Application Locally

To run the application locally using Docker, run the following command:

```sh
make run
```

### Publish the Image to the Kind Cluster

To load the Docker image into the Kind cluster, run the following command:

```sh
make publish
```

## Deploy the Application in the Kubernetes Cluster

Using kustomize, you can deploy the application to different environments.

```sh
kubectl apply -k kustomize/overlays/development
or
kubectl apply -k kustomize/overlays/production
```
