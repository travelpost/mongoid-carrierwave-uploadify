class Photo
  include Mongoid::Document
  field :title
  embedded_in :story, :inverse_of => :photos
end
