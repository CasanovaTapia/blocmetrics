require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "POST" do

    before do
      post :create, title: "Event title", created_at: (@t = Time.now)
      @event = Event.last
    end

    it "should receive params" do
      expect(@event.title).to eq("Event title")
      expect(@event.created_at).to eq(@t)
    end
  end
end
