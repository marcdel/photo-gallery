class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.paginate(page: params[:page])
  end

  def show
    @gallery = Gallery.find(params[:id])
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
      flash[:success] = "Gallery #{@gallery.title} created."
      redirect_to galleries_url
    else
      render 'new'
    end
  end
end
