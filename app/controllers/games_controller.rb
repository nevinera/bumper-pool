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
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def destroy
  end
end
