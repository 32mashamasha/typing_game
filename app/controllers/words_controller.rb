class WordsController < ApplicationController
  def index
    @words = Word.all.order("RANDOM()").pluck(:text)
    render json: @words
  end
end
