# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "node1" do |node1|
    node1.vm.box = "ubuntu/bionic64"
    node1.vm.box_check_update = true
    node1.vm.network "private_network", ip: "10.0.0.4"

    node1.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "node1"
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "ubuntu/bionic64"
    node2.vm.box_check_update = true
    node2.vm.network "private_network", ip: "10.0.0.5"

    node2.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "node2"
    end
  end
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook-install-docker.yml"
      ansible.groups = {
        "nodes" => ["node[1:2]"],
        "manager" => ["node1"]
      }
      ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  end
end