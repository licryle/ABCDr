Rails.application.routes.draw do
  root to: 'words#home'

  get '/words/:id/:word', to: 'words#show', as: 'word'
  resources :words

  scope controller: :pages do
    get :collaborer
    get :manifeste
    get :association
    get :proprieteintellectuelle
    get :confidentialite
    get :contact
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end