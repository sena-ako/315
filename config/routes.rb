Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :topics do
    resources :likes, only: [:create]
  end
  get 'omikuzis/index' => 'omikuzis#index'
  get 'omikuzis/top' => 'omikuzis#top'
  root 'topics#index'
end
