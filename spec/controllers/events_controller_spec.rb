require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "POST" do

    before do
      post :create, title: "Event title", created_at: Time.now
      @event = Event.last
    end

    it "should receive params"  
end
