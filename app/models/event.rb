class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :app

  validates :title, presence: true
end
