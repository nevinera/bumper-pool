class Player < ActiveRecord::Base
  attr_accessible :name

  has_many :triumphs, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losses,   :class_name => 'Game', :foreign_key => 'loser_id'
end
