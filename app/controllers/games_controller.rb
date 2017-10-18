class GamesController < ActionController::Base

  def index
    @games = Game.all
  end

  def new
  end

  def create
    game = Game.create(secret_word: GenerateRandomWord.new.call)
    game.save
    redirect_to edit_game_path(game)
  end

  def edit
    @game = Game.find(params[:id])
    guess_character = params[:guess_character]

    if request.post? then
      @guess_fitness_result = @game.guess_fitness(guess_character)
      if(@game.affects_game_state?(@guess_fitness_result)) then
        guess = Guess.create(value: guess_character)
        @game.guesses << guess
        @game.save
      end
    end
  end

end
