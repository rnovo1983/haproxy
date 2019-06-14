#
# Cookbook:: lb
# Recipe:: default
# Auhor:: Roberto Novo
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe "dbase::default"


package 'haproxy' do
     action :install
     version node['lb']['version']
end

#haproxy.cfg
template "/etc/haproxy/haproxy.cfg" do
  source 'haproxy.cfg.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    user:                node['lb']['user'],
    group:               node['lb']['group'],
    default_mode:        node['lb']['mode'],
    ca-base:             node['lb']['ssl']['ca-base'],
    crt-base:            node['lb']['ssl']['crt-base'],
    frontend_mode:       node['lb']['frontend']['mode'],
    frontend_ip:         node['lb']['frontend']['ip'],
    frontend_port:       node['lb']['frontend']['port'],
    backend_mode:        node['lb']['backend']['mode'],
    backend_balance:     node['lb']['backend']['balance'],
    backend_option:      node['lb']['backend']['option'],
    backend_servers:     node['lb']['backend']['servers'],
    stats_ip:            node['lb']['stats']['ip'],
    stats_port:          node['lb']['stats']['port'],
    stats_status:        node['lb']['stats']['status'],
    stats_authentication node['lb']['stats']['authentication']

  )
end

service 'haproxy' do
    action [:restart, :enable]
end
