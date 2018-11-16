require_relative '../BaseRabbitMQTopic'
require_relative './PatternMatchingRabbitMQRoom'

class PatternMatchingRabbitMQTopic < BaseRabbitMQTopic
  def initialize name:, channel:
    super()

    @channel = channel
    @exchange = @channel.topic(name, :durable => false)
  end  

  def createRoom name:, exclusive: false, autoDelete: false
    room = PatternMatchingRabbitMQRoom.new(
      name: name,
      exclusive: exclusive,
      autoDelete: autoDelete,
      channel: @channel,
      exchange: @exchange
    )
    
    addRoom(room: room)

    return room
  end

  def publish room:, payload:, correlationId: nil, replyTo: nil
    @exchange.publish(
      payload, 
      :routing_key => room, 
      :correlation_id => correlationId,
      :reply_to => replyTo,
      :persistent => false
    )
  end
end