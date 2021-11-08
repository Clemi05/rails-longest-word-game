require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
    @letters = @letters.each do |letter|
      puts letter
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    words = JSON.parse(URI.open(url).read)
    if words["word"].split("").include? @letters
      @word = "test ok"
      puts @letters
    else
      @word = "test nok"
    end
  end
end
