class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new
    @rest_link = @restaurant
  end

  def edit
    @menu = Menu.find(params[:id])
    @rest_link = @menu.restaurant
  end

  def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @menu = @restaurant.menus.build(menus_params)

    if @menu.save
      redirect_to @menu
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menus_params)
      redirect_to @menu
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to restaurants_path
  end

  private
    def menus_params
      params.require(:menu).permit(:title, :body)
    end
end
