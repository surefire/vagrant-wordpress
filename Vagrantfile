Vagrant::Config.run do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "./puppet/modules"
    puppet.manifests_path = "./puppet/manifests"
  end

  config.vm.forward_port 80, 8000
  config.vm.share_folder "v-root", "/vagrant", ".", owner: "www-data", group: "www-data"
end
