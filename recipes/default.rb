#
# Cookbook Name:: yum-plugin-versionlock
# Recipe:: default
#
# Copyright 2015, Marius Karnauskas <marius@karnauskas.lt>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

package 'yum-plugin-versionlock'

template '/etc/yum/pluginconf.d/versionlock.conf' do
  mode 0o644
  source 'versionlock.conf.erb'
  variables(
    enabled: node['yum-plugin-versionlock']['enabled'],
    locklist: node['yum-plugin-versionlock']['locklist'],
    follow_obsoletes: node['yum-plugin-versionlock']['follow_obsoletes']
  )
end
