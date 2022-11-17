class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to restaurant_path(@bookmark), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
