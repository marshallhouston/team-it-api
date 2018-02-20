class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, :phone, :team_role, presence: true
    has_many :team_followers
    has_many :teams, through: :team_followers

  enum team_role: ["family", "coach"]
end
