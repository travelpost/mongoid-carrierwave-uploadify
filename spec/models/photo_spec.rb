require 'spec_helper'
require 'remarkable/mongoid'

describe Photo do
  # Remarkable/mongoid macro
  it { should be_embedded_in(:story) }
end
