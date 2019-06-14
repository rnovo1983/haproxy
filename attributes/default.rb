
# Cookbook:: lb
# Recipe:: default
# Auhor:: Roberto Novo
# Copyright:: 2019, The Authors, All Rights Reserved.

#haproxy app default configuration
default['lb']['version']                       = '1.9.8'
default['lb']['user']                          = 'haproxy'
default['lb']['group']                         = 'haproxy'
default['lb']['mode']                          = 'http'

# Default SSL material locations
default['lb']['ssl']['ca-base']                = '/etc/ssl/certs'
default['lb']['ssl']['crt-base']               = '/etc/ssl/private'

#frontend Configuration
default['lb']['frontend']['mode']              = 'http'
default['lb']['frontend']['ip']                = '*'
default['lb']['frontend']['port']              = '80'

#backend Configuration
default['lb']['backend']['mode']               = 'http'
default['lb']['backend']['balance']            = 'roundrobin'
default['lb']['backend']['option']             = 'forwardfor'
default['lb']['backend']['servers']            = ['web1.example.com  192.168.1.101:80',
                                                  'web2.example.com  192.168.1.102:80',
                                                  'web3.example.com  192.168.1.103:80']

#stats Configuration
default['lb']['stats']['status']               = 'enable'
default['lb']['stats']['ip']                   = '*'
default['lb']['stats']['port']                 = '1936'
default['lb']['stats']['authentication']       = 'username:password'
