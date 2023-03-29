class Membership < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :channel

  # Validations
  validates :channel, uniqueness: { scope: :user }
end
