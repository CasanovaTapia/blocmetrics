class Event < ActiveRecord::Base
  belongs_to :user

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

  def jul
    Date.parse("2014-07-30 23:45:22")
  end

  def month_count(month)
    Event.where(created_at: month.beginning_of_month..month.end_of_month).count
  end

end
