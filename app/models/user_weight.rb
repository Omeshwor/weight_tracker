class UserWeight < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true, numericality: { greater_than: 0, less_than: 1000 }
end
