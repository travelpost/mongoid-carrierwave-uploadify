require 'spec_helper'
require 'remarkable/mongoid'

describe Photo do
  before(:each) do
    @uploader = Class.new(CarrierWave::Uploader::Base)
    @story = Fabricate(:story)
  end

  # Remarkable/mongoid macro
  it { should be_embedded_in(:story) }

  describe "#image" do
    # Don't test carrierwave itself. It has a great test suite.
    # Test only that carrierwave is attached and working plus
    # any extras we add -- like saving dimensions.

    it "when no file is assigned" do
      @photo = @story.photos.create
      @photo.image.should be_blank
    end

    it "when file is assigned" do
      @photo = @story.photos.create :image_filename => "test.jpg"
      @photo.image.current_path.should == (Rails.public_path + "/uploads/photo/image/#{@photo.id}/test.jpg")
    end
  end
end
