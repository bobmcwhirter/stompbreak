
require 'torquebox-stomp'

class HeartbeatStomplet < TorqueBox::Stomp::JmsStomplet

  include TorqueBox::Injectors

  def initialize()
    super
    @destination = inject( '/topics/heartbeat' )
  end

  def on_subscribe(subscriber) 
    subscribe_to( subscriber, @destination )
  end

end
