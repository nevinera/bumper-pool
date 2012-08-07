class GamesController < ApplicationController

  def sidebar?
    true
  end
  def sidebar
    'games/sidebar'
  end

  def index
    @games = Game.includes(:winner, :loser).order('played_on desc, created_at desc').all
  end

  def show
  end

  def new
    @game = Game.new
    @players = Player.order('name asc').all
  end

  def create
    @game = Game.new(params[:game])

    if @game.save
      redirect_to @game
    else
      @players = Player.order('name asc').all
      render :new
    end
  end

  def edit
  end
  
  def update
  end

  def destroy
  end
end
