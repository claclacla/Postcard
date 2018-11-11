# Postcard (Ruby version) 

## An abstraction layer over message brokers 

--------------------------------------------------------------------------------

### Prerequisites

What things you need to install the software

```
docker 17+
docker-compose 1.19.0+

```

--------------------------------------------------------------------------------

### Development

```bash
# Change the directory to the docker development 
cd docker/dev

# Create a .env file with your local application folder
echo "APP_FOLDER=/path-to-your-local/app" > .env 

# Run the services using docker compose
sudo docker-compose up -d

# Get into the container with the following command:
# sudo docker exec -it Postcard bash

# The examples folder path into the running container is:
# /usr/src/app/examples

```

--------------------------------------------------------------------------------

### PostcardRB gem creation

```bash
# Get into the container with the following command:
sudo docker exec -it Postcard bash

# Move to the Postcard folder
cd /usr/src/app/lib/PostcardRB

# Build the gem
gem build PostcardRB.gemspec

# Install it
gem install postcard_rb-<version>.gem

# Get into the ruby command line ...
irb

# ... and check the correct installation with the following command:
require "postcard_rb"

# The irb would responde with the following line:
# => true

```

--------------------------------------------------------------------------------

## Authors

- **Simone Adelchino** - [_claclacla_](https://twitter.com/_claclacla_)

--------------------------------------------------------------------------------

## License

This project is licensed under the MIT License

--------------------------------------------------------------------------------

## Acknowledgments

- [RabbitMQ](https://www.rabbitmq.com)