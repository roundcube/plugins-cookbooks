default["packagist"]                = {}
default["packagist"]["root"]        = "/vagrant_data"
default["packagist"]["server_name"] = "plugins2.roundcube.net"
default["packagist"]["socket"]      = "/run/php/php7.0-fpm.sock"
default["packagist"]["nginx"]       = "/etc/nginx"
default["packagist"]["email"]       = "plugins@roundcube.net"

default["packagist"]["ga"] = ""

default["packagist"]["smtp"] = {
    "hostname" => "smtp.gmail.com",
    "username" => "",
    "password" => "",
    "encryption" => "ssl",
    "authmode" => "login",
}

default["packagist"]["db"]            = {}
default["packagist"]["db"]["db_name"] = "packagist"
default["packagist"]["db"]["user"]    = "packagist"
default["packagist"]["db"]["pass"]    = "packagist-db-pwd"

default["packagist"]["solr"]          = {}
default["packagist"]["solr"]["dsn"]   = "http://127.0.0.1:8983/solr/core1"
default["packagist"]["solr"]["host"]  = "127.0.0.1"
default["packagist"]["solr"]["port"]  = "8983"
default["packagist"]["solr"]["path"]  = "/solr"
default["packagist"]["solr"]["core"]  = "core1"

# deploying live
default["packagist"]["live_root"]  = "/var/www"
default["packagist"]["repository"] = "git://github.com/roundcube/plugins.roundcube.net.git"
