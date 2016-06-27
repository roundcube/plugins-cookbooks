Vagrant.configure("2") do |config|
  config.vm.box     = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
  end

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network "private_network", ip: "33.33.108.2"

  # config.vm.network :bridged

  config.vm.synced_folder "../packagist", "/vagrant_data", type: "nfs"

  # config.omnibus.chef_version = "11.6.0"

  # install 
  config.vm.provision "shell", path: 'apt-setup.sh'
  # config.vm.provision :shell, inline: 'mysql_secure_installation'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./"
    chef.add_recipe "apt"
    chef.add_recipe "tomcat-solr"
    chef.add_recipe "packagist"
  
    # You may also specify custom JSON attributes:
    if File.exists?("./dna.json")
      chef.json.merge!(JSON.parse(File.read("./dna.json"))) 
    end
    chef.log_level = :debug
  end

end
