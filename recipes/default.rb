
include_recipe "node"

# Node module Redis commander install
node_npm "redis-commander" do
  action :install
end


include_recipe "supervisor"

supervisor_service "redis-commander" do
  command "redis-commander"
  stdout_logfile "syslog"
  stderr_logfile "syslog"
  startsecs 10
  stopsignal "QUIT"
  stopasgroup true
  killasgroup true
  process_name '%(program_name)s'
end
