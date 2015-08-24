Rails.application.routes.draw do

  root               'application#index'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  delete 'lessons/:id/remove_user' => 'lessons#remove_user'

  resources :users
  resources :account_activations,  only: [:edit]
  resources :password_resets,      only: [:edit, :new, :create, :update]
  resources :lessons,              only: [:new, :create, :show, :index, :update] do
    resources :goals,              only: :update
  end
  resources :schools,              only: [:create, :index, :show, :update]
end
