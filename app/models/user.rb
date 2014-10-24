class User < ActiveRecord::Base
  has_many :apps
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
