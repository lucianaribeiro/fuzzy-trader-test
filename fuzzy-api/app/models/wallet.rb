class Wallet < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  

end
