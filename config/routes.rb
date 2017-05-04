Rails.application.routes.draw do
  root 'landing#index'

  get 'logic' => 'logic#index'
  get 'number_systems' => 'number_systems#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
