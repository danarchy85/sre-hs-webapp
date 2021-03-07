
# sre-hs-webapp

This is a small Ruby web app using Sinatra and Puma, with OAuth2 to authenticate
with us.battle.net and retreive Hearthstone card information from us.api.blizzard.com.

It contains a simple HTML form to input card Class, Mana, and Rarity and display up to 10
cards' Image, Name, Class, Type, Rarity, and Set.


## Run local

Checkout this repository locally and create a directory called '.config' and write an
environment file out containing a valid Battle.net Client Id and Client Secret and then
source the file in Bash

    ~: cat .config/.dev.env
    CLIENT_ID=MY_BATTLENET_API_ID
    CLIENT_SECRET=MY_BATTLENET_API_SECRET

    ~: source .config/.dev.env

Then run `ruby sre-hs-webapp.rb` to start Puma and sre-hs-webapp. The output should show
how to access the endpoint, which is likely: http://127.0.0.1:4567.


## Docker deployment

A Dockerfile and docker-compose.yml is provided for a basic deployment to a locally-run
Docker installation. Settings within docker-compose.yml may need adjusting depending on
your particular Docker setup.

Clons this repository and then within the root directory, build the Docker image using:

    docker build -t sre-hs-webapp .

Then run it with `docker-compose up`. The output should show how to access the endpoint,
which is likely: http://127.0.0.1:4567.
