class Event < ActiveRecord::Base
  belongs_to :user
  cattr_accessor :user_events

  def self.unique_ips
    unique_ips = Event.all.collect(&:ip_address).uniq
  end

  def self.unique_emails
    unique_emails = Event.all.collect(&:property_2).uniq
  end

  def self.visits
    visits = []

    unique_ips.each_with_index do |v, i|
      visits << Event.where(ip_address: unique_ips[i].count)
    end
    visits
  end

  # Collect events by current user
  def self.user_events
    Event.where(user_key: User.current.unique_key)
  end

  # Group events by months, returns a hash with months as keys and events as values
  def self.months
    months = Event.user_events.group_by { |e| e.created_at.beginning_of_month }
  end

  # Collect and count events for a given month
  def self.events_count(month_as_integer)
    events_count = Event.user_events.months.select! { |key, value| key.month == month_as_integer }
    events_count.values.flatten.count
  end

  def self.events_count_array
    counts = []
    for i in 1..12
      counts << Event.user_events.events_count(i)
    end
    counts
  end

end
