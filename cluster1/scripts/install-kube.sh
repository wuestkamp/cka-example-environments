#!/bin/sh

# Source: http://kubernetes.io/docs/getting-started-guides/kubeadm/

apt-get remove -y docker.io kubelet kubeadm kubectl kubernetes-cni
apt-get autoremove -y
systemctl daemon-reload
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y docker.io kubelet=1.18.2-00 kubeadm=1.18.2-00 kubectl=1.18.2-00 kubernetes-cni
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "storage-driver": "overlay2"
}
EOF
mkdir -p /etc/systemd/system/docker.service.d

# Restart docker.
systemctl daemon-reload
systemctl restart docker

# start docker on reboot
systemctl enable docker

docker info | grep -i "storage"
docker info | grep -i "cgroup"

systemctl enable kubelet && systemctl start kubelet

exit 0
