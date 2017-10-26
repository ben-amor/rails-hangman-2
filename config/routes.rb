Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [:new, :create, :index, :show] do
    resources :guesses, only: [:new, :create]
  end

end
