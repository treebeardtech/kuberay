#!/usr/bin/env bash

set -eu -x
helm package ./helm-chart/kuberay-apiserver ./helm-chart/kuberay-operator
helm push kuberay-operator-0.3.0.tgz oci://ghcr.io/treebeardtech/kuberay/helm-chart
helm push kuberay-apiserver-0.3.0.tgz oci://ghcr.io/treebeardtech/kuberay/helm-chart