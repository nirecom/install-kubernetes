# Install Scripts for Kubernetes

Automated installation scripts for Kubernetes control plane and worker nodes. Scripts are split for each step.

## When you install Kubernetes

* 1-docker-19.03.sh (both on master and worker)

Install docker 19.03, which complies with Kubernetes.

* 2-server-common.sh (both on master and worker)

  * Letting iptables see bridged traffic
  * Install kubelet, kubeadm, and kubectl
  * swapoff

* 3-master-first-kubeadm.sh (master only)

kubeadm init on master.

* After running 3, run kubeadm join command that is displayed by kubeadm. (worker only)

* 4-master-post-kubeadm.sh (master only)

Untaint master node, so that pods can run on master as well

## Others (optional)

* client.sh ... Install kubectl on the client
* reset-node.sh ... kubeadm reset and remove .kube files
* docker-compose.sh ... install docker compose

## Scripts that are unavailable so far

* etcd-cluster-unused/

They are completed, but etcd is stable such as etc on the 3rd master node is unhealthy.
