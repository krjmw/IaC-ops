helm install prometheus ./kube-prometheus-stack-82.4.3.tgz \
  -f prometheus-values.yaml \
  -n monitoring \
  --create-namespace
