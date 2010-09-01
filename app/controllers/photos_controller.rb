class PhotosController < ApplicationController
  before_filter :find_story
  before_filter :find_or_build_photo, :except => :index

  def index
    redirect_to @story
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @photo.save
      respond_to do |format|
        format.html { redirect_to [@story, @photo], :notice => 'Photo successfully created' }
        format.js
      end
    else
      render :new
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      redirect_to [@story, @photo], :notice => 'Photo successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to @story
  end

private
  def find_story
    @story = Story.find(params[:story_id])
  end

  def find_or_build_photo
    @photo = params[:id] ? @story.photos.find(params[:id]) : @story.photos.build(params[:photo])
  end
end
