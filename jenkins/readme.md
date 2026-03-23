 获取初始密码
kubectl exec -n jenkins $(kubectl get pod -n jenkins -l app.kubernetes.io/component=jenkins-controller -o name) -- cat /run/secrets/chart-admin-password
