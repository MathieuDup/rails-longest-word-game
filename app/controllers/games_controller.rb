require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    word_serialized = URI.open(url).read
    @word = JSON.parse(word_serialized)
    @answer = params[:score]
    @letters = params[:letters]
    @included = included(@answer, @letters)
  end

  private

  def included(answer, letters)
    (answer.downcase.split('') - letters.split).empty?
  end
end
