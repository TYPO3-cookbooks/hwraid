#
# Cookbook Name:: hwraid
# Recipe:: repository
#
# Copyright 2014, TYPO3 Association
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

# add the hwraid repo
apt_repository "hwraid" do
  uri "http://hwraid.le-vert.net/debian/"
  components ['main']
  distribution node['lsb']['codename']
  keyserver "hkp://keyserver.ubuntu.com"
  key "23B3D3B4"
  action :add
end
