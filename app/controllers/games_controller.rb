class GamesController < ApplicationController
  include AjaxHelper 

  def create
    @game = Game.new(game_params)
    @game.user_id = @user.id    

    respond_to do |format|
      if @game.save
        format.js { render ajax_redirect_to('/homes/') }
      else
        #error
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(:score, :letter_count, :miss_count, :category_id)
  end
end
