composer_dir = "/var/www/.composer"

directory "#{composer_dir}" do
  action    :create
  mode      "0755"
  owner     "www-data"
  group     "root"
  recursive true
end

template "#{composer_dir}/config.json" do
    source "config.json.erb"
    owner "www-data"
    group "root"
    mode "0664"
    variables({
      :github_oauth => node["github"]["oauth_token"],
    })
end
