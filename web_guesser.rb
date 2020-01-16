require 'sinatra'
require 'sinatra/reloader'

number = rand(1..100)

get '/' do
  erb :index, :locals => {:number => number}
end