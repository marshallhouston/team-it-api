class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, :phone, :team_role, presence: true

  enum team_role: ["family", "coach"]
end
