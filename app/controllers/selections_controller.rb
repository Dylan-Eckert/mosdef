class SelectionsController < ApplicationController
  def index
    @selections = Selection.all
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @selection = Selection.new
  end

  def edit
    @selection = Selection.find(params[:id])
  end

  def create
  @menu = Menu.find(params[:menu_id])
  @selection = @menu.selections.build(selections_params)

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

  def destroy
    @selection = Selection.find(params[:id])
    @selection.destroy

    redirect_to restaurants_path
  end

  private
    def selections_params
      params.require(:selection).permit(:name, :ingredients, :price)
    end
end
