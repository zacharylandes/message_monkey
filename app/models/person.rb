class Person < ApplicationRecord
  has_many :messages

  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_uniqueness_of :email

end
