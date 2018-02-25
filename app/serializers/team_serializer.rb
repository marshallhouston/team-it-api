class TeamSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  attributes :name, :team_code
  has_many :users
end
