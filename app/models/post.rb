class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :postable, polymorphic: true
  has_many :replies, as: :postable, class_name: 'Post'
  has_rich_text :rich_content

  # Callback
  before_save :flatten_parent_postable

  private

  def flatten_parent_postable
    return if postable.instance_of?(Channel) || postable.postable.instance_of?(Channel)

    self.postable = postable.postable
  end
end
