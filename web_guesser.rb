require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(1..100)
@color = ""
@guessed = false

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => @color, :guessed => @guessed}
end

def check_guess(guess)
  case true
  when guess == SECRET_NUMBER
    @guessed = true
    @color = "green"
    "You got it right!"
  when (guess - 5) > SECRET_NUMBER
    @color = "crimson"
    "Waaay too high!"
  when guess > SECRET_NUMBER
    @color = "lightcoral"
    "Too high!"
  when (guess + 5) < SECRET_NUMBER
    @color = "crimson"
    "Waaay too low!"
  when guess < SECRET_NUMBER
    @color = "lightcoral"
    "Too low!"
  end
end