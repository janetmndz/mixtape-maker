Rails.application.routes.draw do
  resources :mixtape_songs, only: [:new, :create]
  resources :songs
  resources :mixtapes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
