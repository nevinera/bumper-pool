Pool::Application.routes.draw do

  resources :players
  resources :games

  root :to => 'Games#index'
end
