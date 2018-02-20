Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/teams', to: 'teams#index'
      get '/teams/:id', to: 'teams#show'
    end
  end
end
