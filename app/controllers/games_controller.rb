class GamesController < ActionController::Base

  def index
    @games = Game.all
  end

  def new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    game = Game.create(secret_word: GenerateRandomWord.new.call)
    game.save!
    redirect_to game
  end

  def update
    @game = Game.find(params[:id])
    guess_character = params[:guess_character]

    if !@game.guesses.create(value: guess_character)
      # TODO display validation failure message of Guess
    end

    render :show
  end

end
