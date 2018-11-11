require_relative '../BaseRabbitMQTopic'
require_relative './ExplicitRabbitMQRoom'

class ExplicitRabbitMQTopic < BaseRabbitMQTopic
  def initialize name:, channel:
    super()

    @channel = channel
    @exchange = @channel.direct(name, :durable => false)
  end 

  def createRoom name:, exclusive: false
    room = ExplicitRabbitMQRoom.new(
      name: name,
      exclusive: exclusive,
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