
class HeartbeatService

  include TorqueBox::Injectors

  def initialize(opts={})
    @should_run = true
    @destination = inject( '/topics/heartbeat' )
  end

  def start()
    Thread.new do
      while ( @should_run ) 
        hb = "Heartbeat: #{Time.now}" 
        puts "publishing #{hb} to #{@destination}"
        @destination.publish( hb )
        sleep( 1 )
      end
    end
  end

  def stop()
    @should_run = false
  end
end
