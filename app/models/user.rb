class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :registerable, :validatable
  has_many :messages
  has_many :conversations
end
