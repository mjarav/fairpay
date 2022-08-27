class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :customer, class_name: "User"
  belongs_to :provider, class_name: "User"

end
