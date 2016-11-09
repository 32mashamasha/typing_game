class HomesController < ApplicationController
  def index
    @games = @user.games.order_score    
    @categorys = Category.all
  end

  def sort
    games = []
    condition = params[:condition]
    category = Category.find(params[:category_id])
    categorys = Category.all
    case condition
    when 'score'
      games = @user.games.by_category(category.id).order_score
    when 'letter_count'
      games = @user.games.by_category(category.id).order_letter
    when 'miss_count'
      games = @user.games.by_category(category.id).order_miss
    end    
    respond_to do |format|
      format.js { render "sort", :locals => {games: games, condition: condition, categorys: categorys, category: category} }
    end
  end
end