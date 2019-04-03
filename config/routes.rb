Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lights
  post "/lights/change_color", to: "lights#change_color", as: "change_color"
  post "/groups/:id/get_current_state", to: "groups#get_current_state"
  post "/lights/:id/add_to_group", to: "lights#add_to_group"

  resources :groups

  root to: "groups#index"
end
