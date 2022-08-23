class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :service_bookings, through: :services, source: :bookings

  has_many :chatrooms_as_customer, class_name: "Chatroom", foreign_key: :customer_id
  has_many :chatrooms_as_provider, class_name: "Chatroom", foreign_key: :provider_id

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
