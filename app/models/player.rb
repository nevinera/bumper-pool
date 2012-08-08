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
    if gamecount > 0
      wincount / gamecount.to_f
    else
      0.0
    end
  end

  def wincount_weekly(week=nil)
    week ||= Date.today.strftime('%G-%V')
    @_wincount_weekly ||= {}
    @_wincount_weekly[week] ||= self.triumphs.this_week.count
  end
  def losscount_weekly(week=nil)
    week ||= Date.today.strftime('%G-%V')
    @_losscount_weekly ||= {}
    @_losscount_weekly[week] ||= self.losses.this_week.count
  end
  def gamecount_weekly(week=nil)
    wincount_weekly(week) + losscount_weekly(week)
  end
  def ratio_weekly(week=nil)
    if gamecount_weekly(week) > 0
      wincount_weekly(week) / gamecount_weekly(week).to_f
    else
      0.0
    end
  end
end
