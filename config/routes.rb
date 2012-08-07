Pool::Application.routes.draw do

  resources :players

  root :to => 'Players#index'
end
