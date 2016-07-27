class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
  @restaurant = Restaurant.new(restaurants_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    # check if :order_by param is nil
    if params[:order_by].nil?
      # if it's nil, default to descending order
      @menus = @restaurant.menus.order(created_at: :desc)
    else
      # if there is a params[:order_by], then use its value
      @menus = @restaurant.menus.order("created_at " + params[:order_by])
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurants_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def search

  end

  def search_results
      @restaurants = Restaurant.where("name like ?", "%#{params[:query]}%")
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private
    def restaurants_params
      params.require(:restaurant).permit(:title, :body)
    end
end
