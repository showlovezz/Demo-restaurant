Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    # 瀏覽所有餐廳的最新動態
    # GET restaurants/feeds
    collection do
      get :feeds

      # 十大人氣餐廳
      get :ranking
    end

    # 瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard
    end

    # 收藏 / 取消收藏
    member do
      post :favorite
      post :unfavorite
    end

    # 喜歡 / 取消喜歡
    member do
      post :like
      post :unlike
    end
  end
  
  resources :categories, only: [:show]
  resources :users, only: [:show, :edit, :update]
  root "restaurants#index"

  namespace :admin do
  	resources :restaurants
  	resources :categories
  	root "restaurants#index"
  end	

end
