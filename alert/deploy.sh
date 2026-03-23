#!/bin/bash
kubectl apply -f rabbitmq-alerts.yaml
kubectl apply -f sock-shop-alert.yml
kubectl label prometheusrule -n monitoring my-sock-shop-alerts release=prometheus
kubectl label prometheusrule -n monitoring rabbitmq-alerts release=prometheus

