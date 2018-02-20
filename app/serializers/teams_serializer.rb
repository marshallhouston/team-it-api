class TeamsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team
  attributes :name, :phone
end
