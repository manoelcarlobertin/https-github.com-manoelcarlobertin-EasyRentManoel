class Customer < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :mobile_phone, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
