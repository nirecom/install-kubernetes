#
# Configure stacked etcd: other hosts
#
./kubelet-etcd-priority.sh

export TARFILE=kubernetes-pki.tar

cd
tar xf ~/${TARFILE}
rm ~/${TARFILE}
sudo chown -R root:root pki
if [ -d /etc/kubernetes/pki ]; then
    sudo rm -rf /etc/kubernetes/pki
fi
sudo mv pki /etc/kubernetes

echo "etcd: Done. When all other etcd servers ready, run:"

