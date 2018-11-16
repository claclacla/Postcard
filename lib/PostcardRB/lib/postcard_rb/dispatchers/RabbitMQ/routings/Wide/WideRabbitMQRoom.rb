require_relative '../BaseRabbitMQRoom'

class WideRabbitMQRoom < BaseRabbitMQRoom
  def initialize name:, exclusive: false, autoDelete: false, channel:, exchange:
    queueName = ""
    queueName = name if exclusive

    queue = channel.queue(queueName).bind(exchange, :auto_delete => autoDelete)

    super(channel: channel, queue: queue, exclusive: exclusive)
  end
end