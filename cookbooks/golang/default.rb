execute "add golang repository" do
  action :run
  command "add-apt-repository -y -u ppa:longsleep/golang-backports"
  user "root"
  not_if "grep -q \"longsleep/golang-backports\" /etc/apt/sources.list.d -R"
end

package "golang-go" do; end

directory "#{node[:home]}/local/go" do
  action :create
  user node[:user]
  owner node[:user]
end

execute "add glide repository" do
  action :run
  command "add-apt-repository -y -u ppa:masterminds/glide"
  user "root"
  not_if "grep -q \"masterminds/glide\" /etc/apt/sources.list.d -R"
end

package "glide" do; end
