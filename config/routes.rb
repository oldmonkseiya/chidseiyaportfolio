Rails.application.routes.draw do
  
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show' , as: 'portfolio_show'

  get 'about-me', to: 'page#about'
  get 'contact', to: 'page#contact'

  resources :blogs

  root to: "page#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
