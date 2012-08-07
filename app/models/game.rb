class Game < ActiveRecord::Base
  attr_accessible :winner_id, :loser_id, :played_on, :week

  belongs_to :winner, :class_name => 'Player'
  belongs_to :loser,  :class_name => 'Player'

  before_save :set_week
  def set_week
    self.week = self.played_on.strftime('%G-%V')
  end

  validates :played_on, :timeliness => { :type => :date }
  validates :winner, :presence => true
  validates :loser, :presence => true


  def self.this_week
    where(:week => Date.today.strftime("%G-%V"))
  end
  def self.in_week(week)
    where(:week => week)
  end

  def self.played_by(player)
    where('(winner_id = ? OR loser_id = ?)', player.id, player.id)
  end

  def winner_name
    self.winner.try(:name) || '[Redacted]'
  end
  def loser_name
    self.loser.try(:name) || '[Redacted]'
  end
end
