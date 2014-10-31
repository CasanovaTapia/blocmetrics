class User < ActiveRecord::Base
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :setup_unique_key

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
  
  private
    def setup_unique_key
      self.update_attribute(:unique_key, SecureRandom.hex(6))
    end
end
