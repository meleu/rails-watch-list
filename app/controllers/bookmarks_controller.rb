class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list
    else
      render 'lists/show', status: :unprocessable_entity
      # render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end
end
