require_relative 'postcard_rb/errors/PostcardConnectionRefused'

class PostcardRB
  def initialize dispatcher:
    @CONNECTION_RETRIES = 10
    @CONNECTION_INTERVAL = 2

    @dispatcher = dispatcher 
  end   

  def connect
    begin
      @dispatcher.connect(
        connectionInterval: @CONNECTION_INTERVAL, 
        connectionRetries: @CONNECTION_RETRIES
      )
    rescue DispatcherConnectionRefused
      raise PostcardConnectionRefused
    end  
  end

  def createTopic name:, routing:
    topic = @dispatcher.createTopic(name: name, routing: routing)

    return topic
  end  
end