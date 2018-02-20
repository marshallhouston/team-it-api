class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :team_followers
  has_many :users, through: :team_followers

end
