Rails.application.routes.draw do

# ----------------------
# about/top page 
# ----------------------

  get 'home/top'
  get 'home/about'
  # rootパス
  root 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
