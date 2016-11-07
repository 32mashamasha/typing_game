class HomesController < ApplicationController
  def index
  	@games = @user.games.order_score    
    @categorys = Category.all
  end

  def sort
  	@games = []
  	@condition = params[:condition]
  	case @condition
  	when 'score'
  		@games = @user.games.order_score
  	when 'letter_count'
  		@games = @user.games.order_letter
  	when 'miss_count'
  		@games = @user.games.order_miss
  	end	
  end
end