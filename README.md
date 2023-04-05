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

To build for a specific z-release such as 4.11.16 use `oc adm` command to extract the image URL of the driver-toolkit:

```
# oc adm release info quay.io/openshift-release-dev/ocp-release:4.11.16-x86_64 --image-for=driver-toolkit
quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:1291f91ad981a9cad040c9fdbef48357aff74900995925e1c3bcd32e178a0a32
```

Check corresponding kernel version:

```
# podman run --authfile pull-secret.json quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:1291f91ad981a9cad040c9fdbef48357aff74900995925e1c3bcd32e178a0a32 ls /lib/modules/
4.18.0-372.32.1.el8_6.x86_64
4.18.0-372.32.1.rt7.189.el8_6.x86_64
kabi-current
kabi-rhel80
kabi-rhel81
kabi-rhel82
kabi-rhel83
kabi-rhel84
kabi-rhel85
kabi-rhel86
```

Update Dockerfile with FROM quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:1291f91ad981a9cad040c9fdbef48357aff74900995925e1c3bcd32e178a0a32

Update Makefile with hardcoded kernel version 4.18.0-372.32.1.el8_6.x86_64

Build container

```
# podman build --authfile=pull-secret.json -t intel-uncore-frequency:v4.11.16 -f ./Dockerfile
```

## Load

Edit intel-uncore-frequency-driver.yaml and point the image to your container image, apply manifests to the cluster

```
oc create ns intel-uncore-frequency-mod
oc create -f intel-uncore-frequency-driver.yaml -n intel-uncore-frequency-mod
```


### Verify


