class SelectionsController < ApplicationController
  def index
    @selections = Selection.all
  end

  def new
    @selection = Selection.new
    @menu = Menu.find(params[:menu_id])
  end

  def edit
    @selection = Selection.find(params[:id])
  end

  def create
  @selection = Selection.new(selections_params)

    if @selection.save
      redirect_to @selection
    else
      render :new
    end
  end

  def show
    @selection = Selection.find(params[:id])
  end

  def update
    @selection = Selection.find(params[:id])

    if @selection.update(selections_params)
      redirect_to @selection
    else
      render :edit
    end
  end

  private
    def selections_params
      params.require(:selection).permit(:menu, :name, :ingredients, :price)
    end
end
