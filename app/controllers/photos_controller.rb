class PhotosController < ApplicationController
  before_filter :find_story
  before_filter :find_or_build_photo, :except => [:index, :sort]

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

  def sort
    # params[:photo] is an array of photo IDs in the order
    # the should be set in the story. Take each ID and it's
    # index in the array, find the photo with the ID and set
    # it's position to the index. Run through the whole ID 
    # array. Mongoid will automatically do an atomic update
    # of only the photos whose position has changed.
    params[:photo].each_with_index do |id, idx|
      @story.photos.find(id).position = idx
    end
    @story.save
    render :nothing => true
  end

private
  def find_story
    @story = Story.find(params[:story_id])
  end

  def find_or_build_photo
    @photo = params[:id] ? @story.photos.find(params[:id]) : @story.photos.build(params[:photo])
  end
end
