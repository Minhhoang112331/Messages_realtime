class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  scope :get_by_sender_and_receiver_id, ->(sender_id, receiver_id){ where("(sender_id =  :sender_id AND receiver_id = :receiver_id) OR (sender_id = :receiver_id AND receiver_id = :sender_id)", sender_id: sender_id, receiver_id: receiver_id)}
end
