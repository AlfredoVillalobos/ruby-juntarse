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
    post 'show_post'
    post 'response_invitation'
  end
  resources :pages do
    collection do
      get 'index'
      get 'dashboard'
      post 'dashboard'
      get 'invitations'
      post 'invitations'
      post 'searched_users'
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
      get 'steps/:id', :action => 'steps', :as  => 'steps'
      post 'choose_sports/:id', :action => 'choose_sports',
                                :as  => 'choose_sports'
      post 'choose_gender_and_age/:id', :action => 'choose_gender_and_age',
                                        :as  => 'choose_gender_and_age'
      post 'chose_disponibility/:id', :action => 'chose_disponibility',
                                      :as  => 'chose_disponibility'
    end
  end

  get 'rooms/show'

  root 'pages#index'
  mount ActionCable.server => '/cable'
end
