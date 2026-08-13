set -euo pipefail
echo "${KUBECONFIG_B64}" | base64 -d > kubeconfig
kubectl --kubeconfig kubeconfig apply -f kubernetes/
