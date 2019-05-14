#!/bin/bash
echo "Starting manager..."
CMD=$(vagrant ssh -c "docker swarm init --advertise-addr 10.0.0.4" node1 | grep 'docker swarm join --token'| sed -e 's/^[[:space:]]*//;s/[[:cntrl:]]*$//')
echo "$CMD"
echo "Starting node..."
vagrant ssh -c "${CMD}" node2
vagrant ssh -c "docker info | grep Swarm" node2