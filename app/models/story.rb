class Story
  include Mongoid::Document
  field :title
  field :body
  embeds_many :photos
end
