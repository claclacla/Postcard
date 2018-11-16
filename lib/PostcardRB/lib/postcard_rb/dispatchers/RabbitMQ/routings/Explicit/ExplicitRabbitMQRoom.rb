require_relative '../BaseRabbitMQRoom'

class ExplicitRabbitMQRoom < BaseRabbitMQRoom
  def initialize name:, exclusive: false, autoDelete: false, channel:, exchange:
    queueName = ""
    queueName = name if exclusive

    queue = channel.queue(queueName, :auto_delete => autoDelete).bind(exchange, :routing_key => name)

    super(channel: channel, queue: queue, exclusive: exclusive)
  end
end