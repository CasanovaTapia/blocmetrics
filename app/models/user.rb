class User < ActiveRecord::Base
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :setup_unique_key

  private
    def setup_unique_key
      self.update_attribute(:unique_key, SecureRandom.hex(6))
    end
end
