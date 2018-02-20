Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :teams, only: [:index, :show, :create]
      post "/teams/:team_id/followers", to: "team_followers#create"
    end
  end
end
