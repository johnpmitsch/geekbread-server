class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :recipes
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User
end
