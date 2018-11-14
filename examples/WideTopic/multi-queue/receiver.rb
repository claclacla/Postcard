require 'json'

require_relative '../../../lib/printExecutionTime'

require_relative '../../../lib/PostcardRB/lib/postcard_rb'
require_relative '../../../lib/PostcardRB/lib/postcard_rb/errors/PostcardConnectionRefused'
require_relative '../../../lib/PostcardRB/lib/postcard_rb/dispatchers/RabbitMQ/RabbitMQDispatcher'
require_relative '../../../lib/PostcardRB/lib/postcard_rb/Routing'

configFilePath = File.expand_path('../../../config.json', __FILE__)
configFile = File.read configFilePath
config = JSON.parse(configFile)

dispatcher = RabbitMQDispatcher.new(host: config["rabbitmq"]["address"])
postcard = PostcardRB.new(dispatcher: dispatcher)

begin
  postcard.connect
rescue PostcardConnectionRefused
  abort "RabbitMQ connection refused"
end

printExecutionTime

topic = postcard.createTopic(name: "topic2", routing: Routing.Wide)
room = topic.createRoom(name: "room2")

room.subscribe { |properties, payload|
   puts " [x] Received #{payload}"

   duration = Random.rand(1...10)
   puts "I'll sleep for " + duration.to_s + " s"
   sleep duration
   puts "Awaken!"
}