class Channel < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :posts, as: :postable, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }

  # Callbacks
  after_create :assign_owner

  private

  def assign_owner
    Membership.create!(user:, channel: self)
  end
end
