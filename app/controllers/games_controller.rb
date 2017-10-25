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

end
