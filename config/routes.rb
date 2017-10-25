Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:show, :new, :edit, :update, :create] do
    resources :message, only: [:new, :create, :edit,:update]
  end
  # ログアウト
devise_scope :social_account do
  get 'sign_out', to: "sessions#destroy"
end
  # resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to:  'groups#index'
end
