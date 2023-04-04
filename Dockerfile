FROM registry.redhat.io/openshift4/driver-toolkit-rhel8:v4.12

WORKDIR /usr/src
COPY . /usr/src/intel_uncore_frequency
WORKDIR /usr/src/intel_uncore_frequency
RUN make && make install

WORKDIR /root
ADD entrypoint.sh .
RUN chmod +x /root/entrypoint.sh
