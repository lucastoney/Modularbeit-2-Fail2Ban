Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.box_check_update = false

  lab_password = ENV["FAIL2BAN_LAB_PASSWORD"].to_s

  config.vm.define "server" do |server|
    server.vm.hostname = "fail2ban-server"
    server.vm.network "private_network", ip: "192.168.56.10"
    server.vm.provider "virtualbox" do |vb|
      vb.name = "fail2ban-mod2-server"
      vb.memory = 1024
      vb.cpus = 1
    end
    server.vm.provision "shell",
      path: "skripte/server-bereitstellen.sh",
      env: { "FAIL2BAN_LAB_PASSWORD" => lab_password }
  end

  config.vm.define "tester" do |tester|
    tester.vm.hostname = "fail2ban-tester"
    tester.vm.network "private_network", ip: "192.168.56.20"
    tester.vm.provider "virtualbox" do |vb|
      vb.name = "fail2ban-mod2-tester"
      vb.memory = 768
      vb.cpus = 1
    end
    tester.vm.provision "shell", path: "skripte/tester-bereitstellen.sh"
  end
end
