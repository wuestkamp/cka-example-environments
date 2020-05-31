#!/bin/sh
kubeadm reset -f
sh /vagrant/tmp/master-join-command.sh
systemctl daemon-reload
service kubelet start
