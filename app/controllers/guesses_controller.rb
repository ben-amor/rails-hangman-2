# Controller for Guesses
class GuessesController < ActionController::Base
  def create
    game = Game.find(params[:game_id])

    guess = game.guesses.create(guess_params)

    unless guess.valid? flash[:errors] = guess.errors.full_messages.to_sentence
    end

    redirect_to game
  end

  private

  def guess_params
    params.require(:guess).permit(:value)
  end
end
