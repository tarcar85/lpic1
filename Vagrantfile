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
      source: "../lpic1",
      destination: "lpic1"
    mgmt.vm.provision "shell", inline: <<-HASTAQUI
      #sudo yum update -y && sudo yum install -y git
      sudo sed -i /security/d /etc/apt/sources.list*
      sudo cp -rv * /
      sudo chmod +x /usr/local/sbin/tcpdump.sh
      #sudo systemctl enable tcpdump.service
      #sudo init 6
    HASTAQUI
  end
  config.vm.define "nginx" do |nginx|
    nginx.vm.provider "virtualbox" do |v|
      v.name = "vagrant_nginx"
      v.linked_clone = true
    end
    nginx.vm.box = "learnway/debian-squeeze"
    nginx.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.4",
      netmask: "255.255.255.0"
  end
  config.vm.define "php_fpm" do |php_fpm|
    php_fpm.vm.provider "virtualbox" do |v|
      v.name = "vagrant_php_fpm"
      v.linked_clone = true
    end
    php_fpm.vm.box = "learnway/debian-squeeze"
    php_fpm.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.6",
      netmask: "255.255.255.0"
  end
  config.vm.define "httpd_php" do |httpd_php|
    httpd_php.vm.provider "virtualbox" do |v|
      v.name = "vagrant_httpd_php"
      v.linked_clone = true
    end
    httpd_php.vm.box = "learnway/debian-squeeze"
    httpd_php.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.8",
      netmask: "255.255.255.0"
  end
  config.vm.define "client" do |client|
    client.vm.provider "virtualbox" do |v|
      v.name = "vagrant_client"
      v.linked_clone = true
    end
    client.vm.box = "learnway/debian-squeeze"
    client.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.9",
      netmask: "255.255.255.0"
  end
  config.vm.define "mysql" do |mysql|
    mysql.vm.provider "virtualbox" do |v|
      v.name = "vagrant_mysql"
      v.linked_clone = true
    end
    mysql.vm.box = "learnway/debian-squeeze"
    mysql.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.10",
      netmask: "255.255.255.0"
  end
  config.vm.define "httpd" do |httpd|
    httpd.vm.provider "virtualbox" do |v|
      v.name = "vagrant_httpd"
      v.linked_clone = true
    end
    httpd.vm.box = "learnway/debian-squeeze"
    httpd.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.11",
      netmask: "255.255.255.0"
  end
end
