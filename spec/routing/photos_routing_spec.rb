require "spec_helper"

describe PhotosController do
  describe "routing" do
  
    it "recognizes and generates #index" do
      { :get => "/stories/2/photos" }.should route_to(:controller => "photos", :action => "index", :story_id => "2")
    end
  
    it "recognizes and generates #new" do
      { :get => "/stories/2/photos/new" }.should route_to(:controller => "photos", :action => "new", :story_id => "2")
    end
  
    it "recognizes and generates #show" do
      { :get => "/stories/2/photos/1" }.should route_to(:controller => "photos", :action => "show", :id => "1", :story_id => "2")
    end
  
    it "recognizes and generates #edit" do
      { :get => "/stories/2/photos/1/edit" }.should route_to(:controller => "photos", :action => "edit", :id => "1", :story_id => "2")
    end
  
    it "recognizes and generates #create" do
      { :post => "/stories/2/photos" }.should route_to(:controller => "photos", :action => "create", :story_id => "2")
    end
  
    it "recognizes and generates #update" do
      { :put => "/stories/2/photos/1" }.should route_to(:controller => "photos", :action => "update", :id => "1", :story_id => "2")
    end
  
    it "recognizes and generates #destroy" do
      { :delete => "/stories/2/photos/1" }.should route_to(:controller => "photos", :action => "destroy", :id => "1", :story_id => "2")
    end
  
  end
end
