require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "POST" do

    before do
      post :create, event[name: "Event name", location: "http://example.com", property_1: "sample property", property_2: "another sample", created_at: (@t = Time.now)]
      @event = Event.last
    end

    it "should receive params" do
      expect(@event.name).to eq("Event name")
      expect(@event.location).to eq("http://example.com")
      expect(@event.property_1).to eq("sample property")
      expect(@event.property_2).to eq("another sample")
    end
  end
end
