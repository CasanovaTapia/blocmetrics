require 'rails_helper'

RSpec.describe App, :type => :model do
  describe "validations" do
    context "creating an app with invalid attributes" do
      it "does not create app without name" do
        expect(build(:app, name: nil)).to be_invalid
      end
    end

    context "creating an app with valid attributes" do
      it "creates app if name is present" do
        expect(build(:app, name: "Test App")).to be_valid
      end
    end
  end
end
