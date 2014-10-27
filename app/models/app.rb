class App < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true
end
