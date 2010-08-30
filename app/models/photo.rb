require 'carrierwave/orm/mongoid'

class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  embedded_in :story, :inverse_of => :photos

  # CarrierWave
  mount_uploader :image, ImageUploader
end
