class Game < ActiveRecord::Base
  attr_accessible :winner_id, :loser_id, :played_on, :week

  belongs_to :winner, :class_name => 'Player'
  belongs_to :loser,  :class_name => 'Player'

  before_save :set_week
  def set_week
    self.week = self.played_on.strftime('%G-%V')
  end
end
