class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :customer, class_name: "User"
  belongs_to :provider, class_name: "User"

end
