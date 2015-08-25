# Copyright 2014 N3TWORK, Inc.
#
# Licensed under Apache 2.0 - see the LICENSE file

node.default[:druid][:realtime][:properties]['druid.realtime.specFile'] = ::File.join node[:druid][:config_dir], 'realtime', 'spec.json'

druid File.basename(__FILE__, ".rb") do
  action :install
end

template node[:druid][:realtime][:properties]['druid.realtime.specFile'] do
  source 'realtime.spec.erb'
  variables spec: node[:druid][:realtime][:spec]
  owner node[:druid][:user]
  group node[:druid][:group]
end
