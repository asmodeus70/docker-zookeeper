# docker-zookeeper

This container starts a zokeeper 3.4.10 instance that can be used to create larger zookeeper clusters.

To start a container the following command can be used.

docker run --name zookeeper-instance -t zookeeper-server 1

The number at the end of the command specifies a unique reference that can be changed on a per instance basis so that when the cluster starts all instances have a unique number.

After the identifier an IP address can also be specified if required.
