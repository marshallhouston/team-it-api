class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :team_code, presence: true, uniqueness: true
  has_many :team_followers
  has_many :users, through: :team_followers

  def generate_team_code
    self.team_code = Faker::Number.unique.number(3)
  end

end
