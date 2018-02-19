class TeamSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  attributes :name, :phone
end
