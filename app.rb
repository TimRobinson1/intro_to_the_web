# inside app.rb
require 'sinatra'

get '/' do
  'hello!'
end

get '/secret' do
  'This is a secret page'
end

get '/cat-naming' do
  erb(:form)
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb(:index)
end

get '/random-cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end
