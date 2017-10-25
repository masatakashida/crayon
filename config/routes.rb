Rails.application.routes.draw do


  resources :charges

# ----------------------
# masataka////
# ----------------------

  get 'masataka/javascript'
  get 'masataka/css'
  get 'masataka/html'


# ----------------------
# user
# ----------------------

  resources :users

# ----------------------
# content 
# ----------------------


# ----------------------
# home/about:top page 
# ----------------------

  get 'home/top'
  get 'home/about'
  # rootパス
  root 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
