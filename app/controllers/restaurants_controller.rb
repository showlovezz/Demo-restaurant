class RestaurantsController < ApplicationController

	before_action :set_restaurant, only: [:show, :dashboard]

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

 	private

 	def set_restaurant
 		@restaurant = Restaurant.find(params[:id])
 	end
	
end
