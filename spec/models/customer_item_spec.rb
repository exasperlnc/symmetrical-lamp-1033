require 'rails_helper'

RSpec.describe CustomerItem do
  describe "relationships" do
    it {should belong_to :item}
    it {should belong_to :customer}
  end
end