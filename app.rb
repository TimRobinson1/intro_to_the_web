# inside app.rb
require 'sinatra'

get '/' do
  'hello!'
end

get '/secret' do
  'This is a secret page'
end

get '/test' do
  'Test page'
end

get '/random' do
  'asd;maspdma'
end

get '/cat' do
  erb(:index)
end
