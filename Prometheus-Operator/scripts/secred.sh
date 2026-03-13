# 先登录，生成 ~/.docker/config.json
#docker login --username=<用户名> crpi-ylw7gpcmxpqjz8c6.cn-wulanchabu.personal.cr.aliyuncs.com
kubectl create secret generic regcred \
  --from-file=.dockerconfigjson=$HOME/.docker/config.json \
  --type=kubernetes.io/dockerconfigjson \
  -n jenkins \
  --dry-run=client -o yaml | kubectl apply -f
