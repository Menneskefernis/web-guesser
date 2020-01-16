require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(1..100)
$guessed = false

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guessed => $guessed}
end

def check_guess(guess)
  case true
  when guess == SECRET_NUMBER
    $guessed = true
    "You got it right!"
  when (guess - 5) > SECRET_NUMBER
    "Waaay too high!"
  when guess > SECRET_NUMBER
    "Too high!"
  when (guess + 5) < SECRET_NUMBER
    "Waaay too low!"
  when guess < SECRET_NUMBER
    "Too low!"
  end
end