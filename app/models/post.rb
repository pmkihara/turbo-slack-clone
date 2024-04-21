class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :postable, polymorphic: true
  has_many :replies, as: :postable, class_name: 'Post', dependent: :destroy
  has_rich_text :content

  # Callback
  before_save :flatten_parent_postable

  # Validations
  validates_presence_of :content

  def channel
    postable.instance_of?(Channel) ? postable : postable.postable
  end

  def edited?
    content.created_at != content.updated_at
  end

  private

  def flatten_parent_postable
    return if postable.instance_of?(Channel) || postable.postable.instance_of?(Channel)

    self.postable = postable.postable
  end
end
