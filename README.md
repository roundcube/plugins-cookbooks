# Cookbooks for Roundcube Plugins Repository

## Vagrant setup

 * copy `dna.json.dist` to `dna.json`
 * edit `dna.json`
 * `vagrant up`
 * http://33.33.108.2/

## Server preparation

The server should run Ubuntu Trusty. Before starting, please ensure the latest updates have been applied.

 * `apt-get update`
 * `apt-get upgrade`
 * `apt-get dist-upgrade`
 * `apt-get install ruby make git`
 
Then install all requirements for the cookbooks to run:

`./apt-setup.sh`

## Cookbook Installation

 * set `live: true` in dna.json
 * `chef-solo -c /home/you/cookbooks/chef-solo/solo.rb -o 'recipe[apt],recipe[tomcat-solr],recipe[packagist]'`
