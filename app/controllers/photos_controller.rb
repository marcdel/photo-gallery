class PhotosController < ApplicationController
  before_filter :is_admin?, only: [:create, :update, :destroy]
  def show
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.build(params[:photo])
    if @photo.save
      flash[:success] = "Photo '#{@photo.title}' added successfully."
      redirect_to @gallery
    else
      render "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:success] = "Photo '#{@photo.title}' updated."
      redirect_to @gallery
    else
      render "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id]).destroy
    flash[:success] = "Photo '#{@photo.title}' deleted."
    redirect_to @gallery
  end
end
