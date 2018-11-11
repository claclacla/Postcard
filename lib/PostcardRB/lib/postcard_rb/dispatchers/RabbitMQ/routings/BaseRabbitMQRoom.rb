require_relative '../../IRoom'

class BaseRabbitMQRoom
  def initialize channel:, queue:, exclusive: false
    @channel = channel
    @queue = queue
    @exclusive = exclusive
  end

  def subscribe block: true
    begin
      manual_ack = false

      manual_ack = true if @exclusive

      @queue.subscribe(manual_ack: manual_ack, block: block) do |delivery_info, properties, payload|
        yield delivery_info, properties, payload

        @channel.ack(delivery_info.delivery_tag) if @exclusive
      end
    rescue Interrupt => _
    
    end
  end

  implements IRoom
end