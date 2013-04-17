wordpress Cookbook
==================
This cokbooks installs and configures Wordpress in a standalone model (a single host with Apache/PHP anf MySQL in the same box) and works according to the instructions at http://codex.wordpress.org/Installing_WordPress.

Requirements
------------
Works with CentOS 6.3

#### packages
Apache
MySQL
PHP

Attributes
----------
#### wordpress::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wp']['version']</tt></td>
    <td>String</td>
    <td>Wordpress version</td>
    <td><tt>3.5.1</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['checksum']</tt></td>
    <td>String</td>
    <td>Verify the integrity of the wordpress tar ball</td>
    <td><tt>f7d627bc886eac75aae22e526acdbdea244a12a92f02e6084ba5193d4b0d7a97</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['dir']</tt></td>
    <td>String</td>
    <td>Absulte path for the Wordpress installation</td>
    <td><tt>/var/www/wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['log_dir']</tt></td>
    <td>String</td>
    <td>Absulte path for the Wordpress logs</td>
    <td><tt>/var/log/httpd/wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['hostname']</tt></td>
    <td>String</td>
    <td>Your hostname for Apache configuration</td>
    <td><tt>Your VM current hostname (localhost)</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['db']['database']</tt></td>
    <td>String</td>
    <td>Database name</td>
    <td><tt>wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['db']['username']</tt></td>
    <td>String</td>
    <td>Username to access the database</td>
    <td><tt>wp_user</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['db']['password']</tt></td>
    <td>String</td>
    <td>Password to access the database</td>
    <td><tt>wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>['wp']['db']['hostname']</tt></td>
    <td>String</td>
    <td>Hostname of your database</td>
    <td><tt>Your VM current hostname (localhost)</tt></td>
  </tr>
</table>

Usage
-----
#### wordpress::default
Just include `wordpress` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[wordpress]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:

Basilio Briceno <bbh@briceno.mx>
