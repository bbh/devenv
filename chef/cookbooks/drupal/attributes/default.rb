# General settings
default['drupal']['version'] = "7.22"
default['drupal']['checksum'] = "3f64ccfbb1c62bdef870207aa5de84ad11da1c8a94800fce5ad3a484b47cb29b"
default['drupal']['dir'] = "/var/www/drupal"
default['drupal']['log_dir'] = "/var/log/httpd/drupal"
default['drupal']['hostname'] = [node['fqdn']]
default['drupal']['db']['database'] = "drupal"
default['drupal']['db']['username'] = "drupal_user"
default['drupal']['db']['password'] = "drupal_pass"
default['drupal']['db']['hostname'] = [node['fqdn']]