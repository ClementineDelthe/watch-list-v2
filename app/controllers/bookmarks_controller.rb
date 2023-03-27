class BookmarksController < ApplicationController
 before_action :list_params, only: %i[new create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id )
  end

  def list_params
    @list = List.find(params[:list_id])
  end
end
