class GuessesController < ActionController::Base
  def create
    game_id = params[:game_id]
    guess_character = params[:guess_character]

    @game = Game.find(game_id)

    @guess = @game.guesses.create(value: guess_character)
    @guess_correct = @game.correct_guess?(guess_character)

    render "games/show", :id => game_id

  end

  def new
  end
end
