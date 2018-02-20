class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :name, :phone, :email
end
