module PostsHelper
  def replies_link(post)
    link_to post_path(post) do
      tag.div class: wrapper_cls do
        concat(replies_info(post))
        concat(tag.i(class: 'fas fa-chevron-right text-gray-400 text-transparent group-hover/thread:text-gray-400'))
      end
    end
  end

  def replies_info(post)
    tag.div class: 'flex items-center gap-2 text-sm' do
      concat(reply_avatars(post))
      concat(number_of_replies(post.replies.count))
      concat(replies_message(post))
    end
  end

  private

  def reply_avatars(post)
    tag.div class: %w[flex gap-1] do
      User.includes(:posts).where(posts: { postable: post }).distinct.limit(3).pluck(:image_url).map do |image_url|
        concat(user_avatar(user_image: image_url, avatar_size: 'h-5 w-5'))
      end
    end
  end

  def number_of_replies(replies_count)
    tag.span "#{replies_count} #{'reply'.pluralize(replies_count)}", class: 'font-bold text-slack hover:underline'
  end

  def last_reply(post)
    last_created_at = post.replies.order(created_at: :desc).first.created_at
    tag.span "Last reply #{time_ago_in_words(last_created_at)} ago", class: 'group-hover/thread:hidden'
  end

  def view_thread
    tag.span 'View thread', class: 'hidden group-hover/thread:inline'
  end

  def replies_message(post)
    tag.span class: 'text-gray-400' do
      concat(last_reply(post))
      concat(view_thread)
    end
  end

  def wrapper_cls
    %w[flex border rounded border-transparent hover:border-gray-300 hover:bg-white -mx-1 p-1 items-center] +
      %w[group/thread justify-between]
  end
end
