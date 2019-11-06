Rails.application.routes.draw do
  root 'home#index'
  resources :home do
    collection do
      post :turn_on
      post :turn_off
    end
  end
end
