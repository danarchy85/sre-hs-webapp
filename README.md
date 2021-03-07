
# sre-hs-webapp

This is a small Ruby web app using Sinatra and Puma, with OAuth2 to authenticate with us.battle.net and retreive Hearthstone card information from us.api.blizzard.com.

It contains a simple HTML form to input card Class, Mana, and Rarity and display up to 10 cards' Image, Name, Class, Type, Rarity, and Set.


## Environment file

Checkout this repository locally and, within the repo's root directory, create a directory called '.config' and write an environment file out containing a valid Battle.net Client Id and Client Secret and then source the file in Bash

    ~: mkdir .config
    ~: cat > .config/.dev.env
    CLIENT_ID=MY_BATTLENET_API_ID
    CLIENT_SECRET=MY_BATTLENET_API_SECRET
    (Ctrl+d)

    ~: source .config/.dev.env


## Run local

Run `ruby sre-hs-webapp.rb` to start Puma and sre-hs-webapp. The output should show how to access the endpoint, which is likely: http://127.0.0.1:4567.


## Run in Docker

Dockerfile and docker-compose.yml files are provided for a basic deployment to a locally-run Docker installation.

Within the root directory, create the build the Docker image using:

    docker build -t sre-hs-webapp .

Modify docker-compose.yml to adjust for your particular Docker setup, for example replacing network_mode with ports, or using a secrets manager rather than an environment file.

Run it with `docker-compose up` and the output should show your endpoint, which is likely: http://127.0.0.1:4567.
