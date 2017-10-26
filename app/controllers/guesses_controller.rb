class GuessesController < ActionController::Base
  def create
    game = Game.find(params[:game_id])

    game.guesses.create(guess_params)

    redirect_to game

  end

  def new
  end

  private

  def guess_params
    params.require(:guess).permit(:value)
  end
end
