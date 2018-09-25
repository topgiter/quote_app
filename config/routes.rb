Rails.application.routes.draw do
  root 'quotes#index'

  get 'download', to: 'quotes#download', as: :download_quotes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end