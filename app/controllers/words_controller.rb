class WordsController < ApplicationController
  def index
    @words = Word.where(category_id: params[:category_id]).order("RANDOM()").pluck(:text, :description)
    render json: @words
  end
end