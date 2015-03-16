# This file is used by Rack-based servers to start the application.

require 'faye'

require ::File.expand_path('../config/environment',  __FILE__)

bayeux = use Faye::RackAdapter, :mount => '/faye', :timeout => 25
#bayeux.listen(9292)
use Faye::RackAdapter, {:mount => '/faye', :timeout => 25} do |bayeux|
  bayeux.on(:handshake) do |client_id|
    # event listener logic
    puts "slush"
  end
end

run Rails.application
