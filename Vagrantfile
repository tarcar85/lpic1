Vagrant.configure("2") do |config|
  config.vm.define "mgmt" do |mgmt|
    mgmt.vm.provider "virtualbox" do |v|
      v.name = "vagrant_mgmt"
      v.linked_clone = true
      v.gui = false
      v.default_nic_type = "virtio"
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.memory = 512
      v.cpus = 1
    end
    mgmt.vm.box = "learnway/debian-squeeze"
    mgmt.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.2",
      netmask: "255.255.255.0",
      nic_type: "virtio"
    mgmt.vm.provision "file", 
      source: "lpic1",
      destination: "lpic1"
    mgmt.vm.provision "shell", inline: <<-HASTAQUI
      #yum update -y && sudo yum install -y git
      sed -i /security/d /etc/apt/sources.list*
      sudo apt-get update -y && sudo apt-get install -y --force-yes dos2unix
      dos2unix $( find lpic1 )
      cd lpic1 && sudo cp -rv * /
      chmod +x /usr/local/sbin/tcpdump.sh
      chmod +x /etc/init.d/tcpdump.service
      update-rc.d tcpdump.service defaults
      #systemctl enable tcpdump.service
      init 6
    HASTAQUI
  end
  config.vm.define "nginx" do |nginx|
    nginx.vm.provider "virtualbox" do |v|
      v.name = "vagrant_nginx"
      v.linked_clone = true
      v.gui = false
      v.default_nic_type = "virtio"
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.memory = 512
      v.cpus = 1
    end
    nginx.vm.box = "learnway/debian-squeeze"
    nginx.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.4",
      netmask: "255.255.255.0",
      nic_type: "virtio"
    nginx.vm.provision "file", 
      source: "lpic1",
      destination: "lpic1"
    nginx.vm.provision "shell", inline: <<-HASTAQUI
      #yum update -y && sudo yum install -y git
      sed -i /security/d /etc/apt/sources.list*
      sudo apt-get update -y && sudo apt-get install -y --force-yes dos2unix
      dos2unix $( find lpic1 )
      cd lpic1 && sudo cp -rv * /
      chmod +x /usr/local/sbin/tcpdump.sh
      chmod +x /etc/init.d/tcpdump.service
      update-rc.d tcpdump.service defaults
      #systemctl enable tcpdump.service
      init 6
    HASTAQUI
  end
end
