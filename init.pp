# == Class: ssl_certificates::create_certfile
#
# Installs and configures Prod Node1.
# 
# === Copyright
# All Rights Reserved.
#

 
class ssl_certificates::create_certfile  (
 
$vhosts=lookup('vhost::certs_hash'),
)
{
    
  $vhosts.each  |$vhost, $params| {
  
  $cert  = $params['certificate'] 
  $bundle  = $params['bundle']  
  $key  = $params['private_key'] 
   
  file { "/etc/ssl/certs/${vhost}.crt":
    ensure => "present",
    content => "${cert}",
    owner => "apache",
    group => "apache",
    mode    => '0755',
   }
   file { "/etc/ssl/certs/${vhost}.bundle.crt":
    ensure => "present",
    content => "${bundle}",
    owner => "apache",
    group => "apache",
    mode    => '0755',
   }
   file { "/etc/ssl/certs/${vhost}.key":
    ensure => "present",
    content => "${key}",
    owner => "apache",
    group => "apache",
    mode    => '0755',
   }
 
  }
   
# ----------------------------------------------------------------------------
# Add any additional settings *above* this comment block.
# ----------------------------------------------------------------------------

}