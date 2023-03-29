class Channel < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :memberships
  has_many :members, through: :memberships

  # Validations
  validates :name, presence: true, uniqueness: true

  # Callbacks
  after_create :assign_owner

  private

  def assign_owner
    Membership.create!(user: user, channel: self)
  end
end
