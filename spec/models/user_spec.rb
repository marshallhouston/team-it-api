require 'rails_helper'

describe User do
  describe "validations" do
    describe "presence of name, email, phone, and team_role" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:phone) }
      it { should validate_presence_of(:team_role) }
    end

    it "requires a unique email" do
      user1 = User.create(name: 'Bob', email: 'bob@bob.com', phone: '255-555-5555', team_role: 0)
      user2 = User.new(name: 'Bob', email: 'bob@bob.com', phone: '255-555-5555', team_role: 0)
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end
  end

end
