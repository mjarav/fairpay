class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chatrooms_as_customer, class_name: "Chatroom", foreign_key: :customer_id
  has_many :chatrooms_as_provider, class_name: "Chatroom", foreign_key: :provider_id
end
