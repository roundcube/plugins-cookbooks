name 'pluginrepo'
description 'Setup plugins.roundcube.net with this!'
run_list 'recipe[apt]', 'recipe[solr_6]', 'recipe[packagist]'
