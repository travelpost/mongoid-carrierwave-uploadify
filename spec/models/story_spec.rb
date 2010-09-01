require 'spec_helper'
require 'remarkable/mongoid'

describe Story do
  # RemarkableMongoid adds useful macros
  it { should embed_many(:photos) }
end
