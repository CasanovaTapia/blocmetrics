class Event < ActiveRecord::Base
  belongs_to :user
  cattr_accessor :user_events

  # Collect events by current user
  def self.user_events
    user_events = Event.where(user_key: User.current.unique_key)
  end

  # Collect events with unique IP address
  def self.unique_ips
    unique_ips = user_events.select(&:ip_address).uniq
  end

  # Collect events with unique user emails
  def self.unique_users
    unique_users = user_events.select(&:property_2).uniq
  end

  # Group events by months, returns a hash with months as keys and events as values
  def self.months
    months = user_events.group_by { |e| e.created_at.beginning_of_month }
  end

  # Collect and count events for a given month
  def self.month_count(month_as_integer)
    events_count = months.select! { |key, value| key.month == month_as_integer }
    month_count = events_count.values.flatten.count
  end

  def self.events_count_array
    counts = []
    for i in 1..12
      counts << month_count(i)
    end
    counts
  end

end
