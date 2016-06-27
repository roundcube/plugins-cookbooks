#include_recipe "solr::default"

files = ["protwords.txt", "schema.xml", "solrconfig.xml", "stopwords.txt", "synonyms.txt"]
data  = "/opt/solr/core1"
conf  = "#{data}/conf"

directory conf do
  action    :create
  mode      "0644"
  owner     "root"
  group     "tomcat7"
  recursive true
end

files.each do |file|
  cookbook_file "#{conf}/#{file}" do
    source file
    owner  "root"
    group  "tomcat7"
    mode   "0644"
  end
end

directory "#{conf}/lang" do
  mode  "0755"
  owner "root"
  group "tomcat7"
  action :create
end

cookbook_file "#{conf}/lang/stopwords_en.txt" do
  source "stopwords.txt"
  owner  "root"
  group  "tomcat7"
  mode   "0644"
end

execute "ensure ownership on solr" do
  command "chown root:tomcat7 #{data}"
end

service "tomcat7" do
  action :restart
end
