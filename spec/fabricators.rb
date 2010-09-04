require 'faker'

Fabricator(:story) do
  title { Faker::Lorem.sentence}
  body  { Faker::Lorem.paragraphs }
end

Fabricator(:photo) do
  title { Faker::Lorem.sentence }
end