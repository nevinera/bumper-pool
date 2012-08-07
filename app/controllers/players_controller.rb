class PlayersController < ApplicationController

  def sidebar?
    true
  end
  def sidebar
    'players/sidebar'
  end


  def index
    @players = Player.all
  end

  def show
    @player = Player.find params[:id]
    @games = Game.
      includes(:winner, :loser).
      played_by(@player).
      order('played_on desc, created_at desc').
      paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new params[:player]

    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
  end


  def edit
    @player = Player.find params[:id]
  end

  def update
    @player = Player.find params[:id]

    if @player.update_attributes params[:player]
      redirect_to player_path(@player)
    else
      render :edit
    end
  end
end
