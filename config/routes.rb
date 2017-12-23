Rails.application.routes.draw do
  root to: 'pages#home'

  resources :words

  scope controller: :pages do
    get :home
    get :collaborer
    get :manifeste
    get :association
    get :proprieteintellectuelle
    get :confidentialite
    get :contact
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end