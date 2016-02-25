#
# Cookbook Name:: hwraid
# Recipe:: autodetect
#
# Copyright 2012, TYPO3 Association, Steffen Gebert
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# the strings for what we are searching in `lspci` and the recipe that we use for that controller
controllers = [
  { :recipe => "hp-smartarray", :match => "Hewlett-Packard Company Smart Array Controller" },
  { :recipe => "adaptec-aac-raid", :match => "Adaptec AAC-RAID" },
  { :recipe => "lsi-megaraid", :match => "MegaRAID" },
  { :recipe => "lsi-megaraid", :match => "MegaSAS" },
]

# make sure that pciutils package is available
package "pciutils"

ruby_block "detect controllers" do
  block do
    # run `lspci`
    lspci = Mixlib::ShellOut.new("lspci")
    lspci.run_command
    found_a_controller = false

    # check if `lspci` includes any of the controllers specified above
    controllers.each do |controller|
      if lspci.stdout.include?(controller[:match])
        found_a_controller = true
        Chef::Log.info "Found RAID controller '#{controller[:match]}'"
        run_context.include_recipe "hwraid::#{controller[:recipe]}"
      end
    end
    Chef::Log.warn "Did not find any RAID controller." unless found_a_controller
  end
end

