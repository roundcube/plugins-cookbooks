include_recipe "packagist::vhost"

package "htop"
package "curl"
package "git-core"

template "/tmp/mysql-setup.sql" do
  source "mysql.erb"
  mode   "0600"
  owner  "root"
  group  "root"
  variables({
    :db_name => node["packagist"]["db"]["db_name"],
    :db_user => node["packagist"]["db"]["user"],
    :db_pass => node["packagist"]["db"]["pass"]
  })
end
execute "mysql -u root < /tmp/mysql-setup.sql"

if node.attribute?("live") && node["live"] == true
  include_recipe "packagist::deploy"
else
  include_recipe "packagist::configure"
  include_recipe "packagist::install"
  include_recipe "packagist::db"
end

include_recipe "packagist::solr"
include_recipe "packagist::cron"
include_recipe "packagist::composer"
