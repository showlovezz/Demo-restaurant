class RestaurantsController < ApplicationController

	before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite, :like, :unlike]

	def index
		@restaurants = Restaurant.page(params[:page]).per(9)
		@categories = Category.all
	end

	def show
		@comment = Comment.new
	end

	# GET restaurants/feeds
 	# 會去 render app/views/restuarants/feeds.html.erb
 	def feeds
   	@recent_restaurants = Restaurant.all.order(created_at: :desc).limit(10)
   	@recent_comments = Comment.all.order(created_at: :desc).limit(10)
 	end

 	# GET restaurants/dashboard
 	# 會去 render app/views/restuarants/dashboard.html.erb
 	def dashboard
 	end

 	# POST /restaurants/:id/favorite
 	def favorite
 		@restaurant.favorites.create!(user: current_user)
 		@restaurant.count_favorites
 		redirect_back(fallback_location: root_path) # 導回上一頁
 	end

 	# POST /restaurants/:id/unfavorite
 	def unfavorite
 		favorites = Favorite.where(restaurant: @restaurant, user: current_user)
 		favorites.destroy_all
 		@restaurant.count_favorites
 		redirect_back(fallback_location: root_path)
 	end

 	# POST /restaurants/:id/like
 	def like
 		@restaurant.likes.create!(user: current_user)
 		redirect_back(fallback_location: root_path) # 導回上一頁
 	end

	# POST /restaurants/:id/unlike
	def unlike
		likes = Like.where(restaurant: @restaurant, user: current_user)
		likes.destroy_all
		redirect_back(fallback_location: root_path)
	end 	

 	private

 	def set_restaurant
 		@restaurant = Restaurant.find(params[:id])
 	end
	
end
