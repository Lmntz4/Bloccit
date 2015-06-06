Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resource :summary, only: [:create, :show]
    end
  end
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end