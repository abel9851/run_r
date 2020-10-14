Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
    resources :messages, only: :create
  end

  resources :users, only: :show do
    resources :five_km_records,  only: [:create, :update, :destroy]
    resources :ten_km_records,  only: [:create, :update, :destroy]
    resources :half_records,  only: [:create, :update, :destroy]
    resources :full_records,  only: [:create, :update, :destroy]
  end

  resources :records,  only: [:new, :edit]
  resources :vdots,  only: [:index]
  post '/tweets/:tweet_id/likes' => "likes#create"
  delete '/tweets/:tweet_id/likes' => "likes#destroy"
  mount ActionCable.server => '/cable'

end
