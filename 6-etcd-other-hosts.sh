#
# Configure stacked etcd: other hosts
#

export HOST0=k8s-master-ne1a
export HOST1=k8s-master-ne1c
export HOST2=k8s-master-ne1d
export SCPUSER=nire

cd ~
sudo tar xf ~/${TARFILE}
rm ~/${TARFILE}
sudo chown -R root:root pki
if [ -d /etc/kubernetes/pki ]; then
    rm -rf /etc/kubernetes/pki
fi
sudo mv pki /etc/kubernetes
sudo kubeadm init phase etcd local --config=~/kubeadmcfg.yaml

echo "All Done."
