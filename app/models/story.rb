class Story
  include Mongoid::Document
  field :title
  field :body
  field :start_at, :type => Time
end
