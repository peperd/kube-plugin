# GETTING STARTED

## Prerequisites

* u have running available deployment <br>
check ```kubectl get deployments```
* u have running available pod <br>
check : ```kubectl get pods -n namespace``` <br>

## To run plugin on your pod:

* copy plugin on your cluster:
```
wget -O kubeplugin.sh https://raw.githubusercontent.com/peperd/kube-plugin/main/scripts/kubeplugin.sh
```
* copy plugin to bin:
```
kubectl cp kubeplugin.sh pod_name:/usr/local/bin/kubeplugin.sh -n namespace
```
* grant permissions:
```
chmod +x /usr/local/bin/kubeplugin.sh
```
* execute plugin:
```
kubeplugin.sh
```

## Result of execution be like
```
/usr/local/bin/kubeplugin.sh, k3d-demo, k3d-5b8659d98c-q6gvv, 0m, 0Mi
```
