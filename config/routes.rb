Rails.application.routes.draw do
  devise_for :users
  resources :tickets, :except => [:index, :destroy, :show]
  get 'tickets/:reference/confirm', to: 'tickets#confirm_client_email', :as => 'ticket_confirmation'
  get 'tickets/:reference/history', to: 'tickets#history', :as => 'ticket_history'
  root 'tickets#new'

  namespace :admin do
    root 'tickets#index'
    get 'tickets/search', to: 'tickets#search', :as => 'search'
    get 'tickets/new_unassigned', to: 'tickets#new_unassigned', :as => 'new_unassigned_tickets'
    get 'tickets/open', to: 'tickets#open', :as => 'open_tickets'
    get 'tickets/on_hold', to: 'tickets#on_hold', :as => 'on_hold_tickets'
    get 'tickets/closed', to: 'tickets#closed', :as => 'closed_tickets'
    resources :statuses
    resources :tickets, :except => [:destroy, :new]
  end
end
