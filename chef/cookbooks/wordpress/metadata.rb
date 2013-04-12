name             'wordpress'
maintainer       'Basilio Briceno'
maintainer_email 'bbh@briceno.mx'
license          'GNU Lesser General Public License version 3'
description      'Installs/Configures Wordpress on standalone mode'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe "wordpress", "Installs & configures a LAMP stack to load Wordpress on a standalone system"

