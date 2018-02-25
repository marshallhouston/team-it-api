class TeamsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  attributes :name, :team_code
end
