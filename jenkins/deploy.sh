#!/bin/bash
helm install jenkins helm-charts/charts/jenkins -f jenkins-values.yaml -n jenkins --create-namespace
