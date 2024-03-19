require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe "relations" do
    it { should belong_to :gym}
  end
end
