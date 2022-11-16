class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: /\A(\S+)@(.+)\.(\S+)\z/, message: 'format invalid' }, presence: true
  
  belongs_to :booking
end
