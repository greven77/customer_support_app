Rails.application.routes.draw do
  devise_for :users
  resources :tickets, :except => [:index, :destroy, :show]
  get 'tickets/:reference/confirm', to: 'tickets#confirm_client_email', :as => 'ticket_confirmation'
  get 'tickets/:reference/history', to: 'tickets#history', :as => 'ticket_history'
  root 'tickets#new'

  namespace :admin do
    root 'base#index'
    resources :tickets
    resources :statuses
  end
end
