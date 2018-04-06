Rails.application.routes.draw do
  resources :sports

  resources :events do
    collection do
      post 'last_events'
    end
  end
  resources :invitations do
    collection do
      post 'invite_users'
    end
    post 'show_invitation'
    post 'show_response'
    post 'response_invitation'
  end
  resources :pages do
    collection do
      get 'index'
      get 'react'
      get 'dashboard'
      post 'dashboard'
      get 'invitations'
      post 'invitations'
      post 'searched_users'
      get 'edit_profile'
      post 'edit_profile'
    end
  end
  resources :geocoder do
    collection do
      post 'findaddress'
    end
  end
  devise_for :users, controllers:
    { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :aditional_data do
    collection do
      get 'steps'
      post 'choose_sports'
      post 'choose_gender_and_age'
      post 'choose_disponibility'
    end
  end

  get 'rooms/show'

  root 'pages#index'
  mount ActionCable.server => '/cable'
end
