#
# Configure stacked etcd: other hosts
#
export TARFILE=kubernetes-pki.tar

cd
tar xf ~/${TARFILE}
rm ~/${TARFILE}
sudo chown -R root:root pki
if [ -d /etc/kubernetes/pki ]; then
    sudo rm -rf /etc/kubernetes/pki
fi
sudo mv pki /etc/kubernetes
sudo kubeadm init phase etcd local --config=kubeadmcfg.yaml

echo "All Done."