#!/usr/bin/env bash
vagrant up --provider virtualbox

echo '######################## WAITING TILL ALL NODES ARE READY ########################'
sleep 60

echo '######################## INITIALISING K8S RESOURCES ########################'
chmod 400 certs/id_rsa
ssh-keygen -R 192.168.101.101; ssh root@192.168.101.101 -i certs/id_rsa -oStrictHostKeyChecking=no -- kubectl apply -f /vagrant/k8s/init.yaml
sleep 20

echo '######################## ALL DONE ########################'
