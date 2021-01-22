#!/bin/bash
#
# Install etcd: Common Part
#
cat << EOF | sudo tee /etc/systemd/system/kubelet.service.d/20-etcd-service-manager.conf
[Service]
ExecStart=
#  Replace "systemd" with the cgroup driver of your container runtime. The default value in the kubelet is "cgroupfs".
ExecStart=/usr/bin/kubelet --address=127.0.0.1 --pod-manifest-path=/etc/kubernetes/manifests --cgroup-driver=systemd
Restart=always
EOF

sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo systemctl status kubelet
echo "Make sure kubelet is running ..."
