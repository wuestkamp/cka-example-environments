# Kubernetes CKA Example Environments

## challenges:

https://levelup.gitconnected.com/kubernetes-cka-example-questions-practical-challenge-86318d85b4d?source=friends_link&sk=cb63eb0edd1210851f01df24b2142db2


## setup and run
You will start a two node cluster on your machine, one master and one worker. For this you need to install VirtualBox and vagrant, then:


```
git clone git@github.com:wuestkamp/cka-example-environments.git
cd cka-example-environments/cluster1
./up.sh

vagrant ssh cluster1-master1
vagrant@cluster1-master1:~$ sudo -i
root@cluster1-master1:~# kubectl get node
```

You should be connected as `root@cluster1-master1`. You can connect to other worker nodes using root, like ssh `root@cluster1-worker1`
If you want to destroy the environment again run `./down.sh`. You should destroy the environment after usage so no more resources are used!


# more
More challenges in a completely simulated CKA environment on https:/killer.sh
