class PhotosController < ApplicationController
  before_filter :is_admin?, only: [:create, :update, :destroy]
  def new
    @gallery = Gallery.find(params[:id])
    @photo = @gallery.photos.new
  end

  def edit

  end

  def create
    @gallery = Gallery.find(params[:id])
    @photo = @gallery.photos.build(params[:photo])
    if @photo.save
      flash[:success] = "Photo '#{@photo.title}' added successfully."
      redirect_to @gallery
    else
      render "new"
    end
  end

  def update
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    #@photo.destroy
    #flash[:success] = "Photo '#{@photo.title}' deleted."
    #redirect_to galleries_url
  end
end
