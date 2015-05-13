Rails.application.routes.draw do

  get 'summaries/create'

  get 'summaries/show'

  devise_for :users

  resources :topics do
  resources :posts, except: [:index]
    resource :summary
  end
   
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end