wordpress Cookbook
==================
This cokbooks installs and configures Wordpress in a standalone model (a single host with Apache/PHP anf MySQL in the same box) and works according to the instructions at http://codex.wordpress.org/Installing_WordPress. Does not set up a wordpress blog. You will need to do this manually by going to http://hostname/wp-admin/install.php (this URL may be different if you change the attribute values).

Requirements
------------
Works with CentOS 6.3

#### packages
Apache
MySQL
PHP

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### wordpress::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wordpress']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### wordpress::default
TODO: Write usage instructions for each cookbook.

e.g.
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
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
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
