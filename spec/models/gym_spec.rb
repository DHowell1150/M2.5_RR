require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe 'relations' do
    it {should have_many :athletes}
  end
end