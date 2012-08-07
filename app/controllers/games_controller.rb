class GamesController < ApplicationController

  def sidebar?
    true
  end
  def sidebar
    'games/sidebar'
  end

  def index
    @games = Game.
      includes(:winner, :loser).
      order('played_on desc, created_at desc').
      paginate(:page => params[:page], :per_page => 50).
      all

    @players = Player.all.sort_by(&:ratio).reverse
  end

  def show
    @game = Game.find params[:id]
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
    @game = Game.find params[:id]
    @players = Player.order('name asc').all
  end
  
  def update
    @game = Game.find params[:id]

    if @game.update_attributes params[:game]
      redirect_to @game
    else
      @players = Player.order('name asc').all
      render :edit
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy
    redirect_to games_path
  end
end
