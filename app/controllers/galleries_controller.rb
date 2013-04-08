class GalleriesController < ApplicationController
  before_filter :is_admin?, only: [:create, :edit, :destroy ]

  def index
    @galleries = Gallery.paginate(page: params[:page])
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.paginate(page: params[:page])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      flash[:success] = "Gallery '#{@gallery.title}' created."
      redirect_to galleries_url
    else
      render "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:success] = "Gallery '#{@gallery.title}' updated."
      redirect_to @gallery
    else
      render "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id]).destroy
    flash[:success] = "Gallery '#{@gallery.title}' deleted."
    redirect_to galleries_url
  end
end
