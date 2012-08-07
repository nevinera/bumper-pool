class Player < ActiveRecord::Base
  attr_accessible :name

  has_many :triumphs, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losses,   :class_name => 'Game', :foreign_key => 'loser_id'

  validates :name, :uniqueness => true

  def wincount
    @_wincount ||= self.triumphs.count
  end
  def losscount
    @_losscount ||= self.losses.count
  end
  def gamecount
    wincount + losscount
  end
  def ratio
    wincount / gamecount.to_f
  end

  def wincount_weekly
    @_wincount_weekly ||= self.triumphs.this_week.count
  end
  def losscount_weekly
    @_losscount_weekly ||= self.losses.this_week.count
  end
  def gamecount_weekly
    wincount_weekly + losscount_weekly
  end
  def ratio_weekly
    wincount_weekly / gamecount_weekly.to_f
  end
end
