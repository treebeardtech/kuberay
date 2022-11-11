#!/usr/bin/env bash

set -eu -x

version=0.3.0-tbt-"$(git rev-parse --short HEAD)"

helm package \
  --version "${version}" \
  ./helm-chart/kuberay-apiserver \
  ./helm-chart/kuberay-operator \
  ./helm-chart/ray-cluster
  
helm push kuberay-operator-"${version}".tgz oci://ghcr.io/treebeardtech/kuberay/helm-chart
helm push kuberay-apiserver-"${version}".tgz oci://ghcr.io/treebeardtech/kuberay/helm-chart
helm push ray-cluster-"${version}".tgz oci://ghcr.io/treebeardtech/kuberay/helm-chart