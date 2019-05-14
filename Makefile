default:
	vagrant up
init:
	vagrant up
	vagrant provision
	./start_cluster.sh
docker:
	vagrant provision
add-swarm:
	./start_cluster.sh
rm-swarm:
	vagrant ssh -c "docker swarm leave --force" node2
	vagrant ssh -c "docker swarm leave --force" node1
add-grafana:
	ansible-playbook ansible/playbook-deploy-grafana.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --extra-vars "ansible_python_interpreter=/usr/bin/python3"
rm-grafana:
	vagrant ssh -c "docker stack rm mon" node1
add-portainer:
	ansible-playbook ansible/playbook-deploy-portainerio.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --extra-vars "ansible_python_interpreter=/usr/bin/python3"
rm-portainer:
	vagrant ssh -c "docker stack rm portainer" node1
manager-shell:
	vagrant ssh node1
node-shell:
	vagrant ssh node2
prune:
	vagrant ssh -c "docker system prune -f" node2
	vagrant ssh -c "docker system prune -f" node1