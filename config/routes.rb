Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  resources :users
  resources :boats
  resources :jobs
  get '/add_to_job' => 'jobs#ajax_index', as: 'add_to_job'
	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
