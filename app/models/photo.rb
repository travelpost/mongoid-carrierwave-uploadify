require 'carrierwave/orm/mongoid'

class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :width,  :type => Integer
  field :height, :type => Integer
  field :orientation
  field :position, :type => Integer, :default => 0
  embedded_in :story, :inverse_of => :photos

  # CarrierWave
  mount_uploader :image, ImageUploader

  # Really no point if we don't have an image so we always require one
  validates_presence_of :image

  before_validation :save_dimensions, :save_orientation, :save_position

  scope :forward, order_by(:position.asc)

private
  def save_dimensions
    if image.path
      self.width  = MiniMagick::Image.from_file(image.path)[:width]
      self.height = MiniMagick::Image.from_file(image.path)[:height]
    end
  end

  def save_orientation
    if image.path
      self.orientation = (height.to_i > width.to_i) ? 'portrait' : 'landscape'
    end
  end

  def save_position
    self.position = (self._index + 1) if self.new_record?
  end
end
