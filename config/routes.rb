Rails.application.routes.draw do
  resources :elections do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    resources :voters, shallow: true do
      get :ballot, on: :member
      post :submit, on: :member
    end
  end
  get	'/elections/:id/audit',	to: 'audit#show',as: 'audit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
