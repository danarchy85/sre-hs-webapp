#!/usr/bin/env ruby
require 'sinatra'
require 'oauth2'

set :locale, 'en_US'

get '/' do
  erb :index
end

get '/search' do
  downcase_params
  url = '/hearthstone/cards'

  response = get_response(url)
  if response
    @cards = response['cards']
    erb :search
  else
    redirect to('/')
  end
end

private 
def client
  OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], site: 'https://us.battle.net')
end

def get_response(url)
  url_api = 'https://us.api.blizzard.com'
  token = client.client_credentials.get_token

  begin
    uri = URI.parse("#{url_api}/#{url}")
    response = token.get(uri, params: @params)
  rescue OAuth2::Error => e
    response = e.response
  end

  if response.status == 200
    JSON.parse(response.body)
  else
    false
  end
end

def downcase_params
  @params.values.map(&:downcase!)
end
