require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'...'z').to_a.sample(10)
    @letters = @letters.each do |letter|
      puts letter
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    word_serialized = URI.open(url).read
    words = JSON.parse(word_serialized)
    if words["found"] == true
      @word = "test ok"
    else
      @word = "test nok"
    end
  end
end
