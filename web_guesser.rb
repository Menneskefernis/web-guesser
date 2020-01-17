require 'sinatra'
require 'sinatra/reloader'

@@number = rand(1..100)
@color = ""
@@turns_left = 5
@guessed = false

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess) if params["guess"]
  new_number if @@turns_left <= 0
  new_number if @guessed
  erb :index, :locals => {:number => @@number, :message => message, :color => @color, :turns_left => @@turns_left, :guessed => @guessed, :cheat => cheat?}
end

def check_guess(guess)
  case true
  when guess == @@number
    @guessed = true
    @color = "green"
    "You got it right!"
  when (guess - 5) > @@number
    @@turns_left -= 1
    @color = "crimson"
    "Waaay too high!"
  when guess > @@number
    @@turns_left -= 1
    @color = "lightcoral"
    "Too high!"
  when (guess + 5) < @@number
    @@turns_left -= 1
    @color = "crimson"
    "Waaay too low!"
  when guess < @@number
    @@turns_left -= 1
    @color = "lightcoral"
    "Too low!"
  end
end

def new_number
  @@number = rand(1..100)
  @@turns_left = 5
end

def cheat?
  params["cheat"].to_s.downcase == "true" ? true : false
end