Gem::Specification.new do |s|
  s.name        = 'postcard_rb'
  s.version     = '0.0.5'
  s.date        = '2018-11-16'
  s.summary     = "PostcardRB"
  s.description = "An abstraction layer over message brokers"
  s.authors     = ["Simone Adelchino"]
  s.email       = 'seconddesire@gmail.com'
  s.files       = ["lib/postcard_rb.rb"]
  s.files       += ["lib/postcard_rb/Routing.rb"]
  s.files       += Dir['lib/postcard_rb/dispatchers/**/*.rb']
  s.files       += Dir['lib/postcard_rb/errors/*.rb']
  s.files       += Dir['lib/postcard_rb/lib/*.rb']
  s.homepage    = 'http://rubygems.org/gems/postcard'
  s.license       = 'MIT'
end