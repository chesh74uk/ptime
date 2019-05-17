Rails.application.routes.draw do
  get 'scenarios/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :customers, :scenarios
  resources :tests
end
