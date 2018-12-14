Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lights
  post "/lights/change_color", to: "lights#change_color", as: "change_color"
end
