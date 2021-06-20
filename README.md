# Charts Demo

## Helm Usages
```bash
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