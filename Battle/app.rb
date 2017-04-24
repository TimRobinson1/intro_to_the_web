require 'sinatra'

class Battle < Sinatra::Base

  get '/' do
    'Hello Battle!'
  end
end
