require 'rubygems'
require 'bundler/setup'

require 'stompbreak'

require 'torquebox-stomp'

use TorqueBox::Stomp::StompJavascriptClientProvider

run Sinatra::Application
