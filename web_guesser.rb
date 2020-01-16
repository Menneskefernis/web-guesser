require 'sinatra'
require 'sinatra/reloader'

random_number = rand(1..100)

get '/' do
  "The secret number is: " + random_number.to_s
end