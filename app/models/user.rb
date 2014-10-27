class User < ActiveRecord::Base
  has_many :apps, dependent: :destroy
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
