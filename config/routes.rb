Rails.application.routes.draw do
  resources :articles
  devise_for :users, path_prefix: 'dv', controllers: { registrations: 'users/registrations',
                                                       confirmations: 'users/confirmations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'articles#index'
end
