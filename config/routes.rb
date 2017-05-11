Rails.application.routes.draw do
  root 'landing#index'

  get 'logic' => 'logic#index'
  get 'number_systems' => 'number_systems#index'
  get 'search_efficiency' => 'search_efficiency#index'
  get 'sets' => 'sets#index'
  get 'hashing' => 'hashing#index'
  get 'tree' => 'tree#index'
  get 'probability' => 'probability#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
