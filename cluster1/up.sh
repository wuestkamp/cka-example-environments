#!/usr/bin/env bash
vagrant up --provider virtualbox

echo '######################## WAITING TILL ALL NODES ARE READY ########################'
sleep 60

echo '######################## INITIALISING K8S RESOURCES ########################'
chmod 400 certs/id_rsa
vagrant ssh cluster1-master1 -c "sudo su - root -c 'kubectl apply -f /vagrant/k8s/init.yaml'"
sleep 20

echo '######################## ALL DONE ########################'
