Pool::Application.routes.draw do

  resources :players
  resources :games do
    collection do
      get :weekly
    end
  end

  root :to => 'Games#weekly'
end
