# Helm Usages

## How to add repos
```bash
$ helm repo add stable https://kubernetes-charts.storage.googleapis.com/
$ helm repo add bitnami https://charts.bitnami.com/bitnami 
```

## How to package chart
```bash
$ helm dependency update ./prometheus-operator
$ helm package ./prometheus-operator
```

## How to fetch chart
```bash
$ helm fetch stable/grafana
$ helm fetch stable/grafana --untar
```

## How to auto-completion
```bash
helm completion bash > ./helm-completion.sh
# for linux
mv ./helm-completion.sh /etc/profile.d/helm-completion.sh
# for mac
mv ./helm-completion.sh /usr/local/etc/profile.d/helm-completion.sh
```
## How to render locally?
```bash
helm template <name> <chart>
```

## How to manage chart by Harbor
```bash
export HELM_EXPERIMENTAL_OCI=1
helm registry login 172.20.2.71 --insecure
helm chart save . 172.20.2.71/rancher/redis
helm chart list
helm chart push --debug 172.20.2.71/rancher/redis:0.1.0

cd ./zookeeper
tar -czvf ./zookeeper.tgz ./*

helm repo add  zetyun http://registry1.aps.datacanvas.com:444/chartrepo/rancher
helm repo add --username admin --password Server2008! zetyun https://172.20.2.71:444/chartrepo/rancher
helm repo add --username admin --password Server2008! zetyun http://registry1.aps.datacanvas.com:444/chartrepo/rancher
```