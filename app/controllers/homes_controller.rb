class HomesController < ApplicationController
  def index
  	@games = Game.order_score
  end

  def new_game
  	@games = Game.order_score
  end

  def sort
  	@games = []
  	@condition = params[:condition]
  	case @condition
  	when 'score'
  		@games = Game.order_score
  	when 'letter_count'
  		@games = Game.order_letter
  	when 'miss_count'
  		@games = Game.order_miss
  	end	
  end
end