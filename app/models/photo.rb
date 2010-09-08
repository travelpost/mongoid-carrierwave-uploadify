require 'carrierwave/orm/mongoid'

class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :width,  :type => Integer
  field :height, :type => Integer
  embedded_in :story, :inverse_of => :photos

  # CarrierWave
  mount_uploader :image, ImageUploader

  # before_create :save_dimensions

private
  # def save_dimensions
  #   self.width  = MiniMagick::Image.from_file(image.path)[:width]
  #   self.height = MiniMagick::Image.from_file(image.path)[:height]
  # end
end
