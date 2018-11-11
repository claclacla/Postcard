require_relative '../BaseRabbitMQRoom'

class PatternMatchingRabbitMQRoom < BaseRabbitMQRoom
  def initialize name:, exclusive: false, channel:, exchange:
    queueName = ""
    queueName = name if exclusive

    queue = channel.queue(queueName).bind(exchange, :routing_key => name, :durable => false)

    super(channel: channel, queue: queue, exclusive: exclusive)
  end
end