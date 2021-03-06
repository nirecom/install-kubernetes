#!/bin/bash
#
# Install kubectl and download .kube files if not exist
# ref. https://qiita.com/nnagashima/items/d7deb00d086b6e276eea
#
if type kubectl > /dev/null 2>&1; then
    echo "kubectl exists. Skip installation..."
else
    # Run docker-19.03.sh first to match with this version of Kubernetes
    echo Install Kubernetes Client .....
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    #sudo apt install apt-transport-https curl
    # was not required on Ubuntu 20.04
    sudo apt update
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
    sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    sudo apt install -y kubectl
fi

[ -f "$HOME/.kube/config" ] && rm $HOME/.kube/config
echo "Copying config to $HOME/.kube ..."
mkdir -p $HOME/.kube
aws s3 cp s3://nirecom-home/.kube/config $HOME/.kube/
