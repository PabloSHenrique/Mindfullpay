class User < ApplicationRecord
  has_many :subscriptions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
