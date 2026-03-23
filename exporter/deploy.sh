#!/bin/bash
helm install json-exporter chart/prometheus-json-exporter-0.19.2.tgz -f values/json_exporter_values_final.yaml -n monitoring
helm install mongodb-exporter-carts chart/prometheus-mongodb-exporter-3.4.0.tgz \
  --namespace monitoring \
  --set mongodb.uri="mongodb://carts-db.sock-shop.svc.cluster.local:27017/admin?ssl=false" \
  --set serviceMonitor.enabled=true \
  --set serviceMonitor.labels.release=prometheus \
  --set serviceMonitor.interval=30s
helm install mysql-exporter-catalogue chart/prometheus-mysql-exporter-2.13.0.tgz \
  --namespace monitoring \
  --set mysql.host=catalogue-db.sock-shop.svc.cluster.local \
  --set mysql.port=3306 \
  --set serviceMonitor.enabled=true \
  --set serviceMonitor.labels.release=prometheus
kubectl create secret generic mysql-exporter-catalogue-prometheus-mysql-exporter-config \
  --namespace monitoring \
  --from-file=.my.cnf=my.cnf \
  --dry-run=client -o yaml | kubectl apply -f -
