require 'rails_helper'

describe Team do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "relationships" do
    it { should have_many :team_followers }
    it { should have_many :users }
  end
end
