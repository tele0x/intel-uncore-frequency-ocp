# Intel Uncore Frequency kernel module for kernel 4.18 (OpenShift version < 4.13)

A pull-secret from Red Hat account is required to build this container.

## Usage

Build container:

```
# podman build --authfile=pull-secret.json -t intel-uncore-frequency:v4.12 -f ./Dockerfile
```

Push to a local or remote registry

```
podman push locahost:intel-uncore-frequency:v4.12 quay.io/ferossi/intel-uncore-frequency-ocp:v4.12
```

## Load

Edit intel-uncore-frequency-driver.yaml and point the image to your container image, apply manifests to the cluster

```
oc create ns intel-uncore-frequency-mod
oc create -f intel-uncore-frequency-driver.yaml -n intel-uncore-frequency-mod
```

### Verify


