class StoriesController < ApplicationController
  before_filter :find_or_build_story, :except => :index

  def index
    @stories = Story.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @story.save
      redirect_to @story, :notice => 'Story successfully created'
    else
      render :new
    end
  end

  def update
    if @story.update_attributes(params[:story])
      redirect_to @story, :notice => 'Story successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to :stories
  end

private
  def find_or_build_story
    @story = params[:id] ? Story.find(params[:id]) : Story.new(params[:story])
  end
end
