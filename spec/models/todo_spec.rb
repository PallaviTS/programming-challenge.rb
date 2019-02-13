require 'rails_helper'

describe Todo do
  it { should have_many(:items).dependent(:destroy) }
  it { should validate_presence_of(:title) }
end
