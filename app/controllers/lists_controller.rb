class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def set_restaurant
    @list = List.find(params[:list_id])
  end

  def restaurant_params
    params.require(:list).permit(:name, :movie, :bookmark)
  end
end
