module PagesHelper
  def user_avatar(user_image:, avatar_size: 'h-7 w-7')
    div_classes = %w[rounded flex overflow-hidden flex-shrink-0].push(avatar_size)
    tag.div class: div_classes do
      if user_image
        tag.image src: user_image
      else
        tag.div class: %w[bg-pink-400 text-white items-center justify-center] do
          tag.i class: %w[fa-solid fa-user]
        end
      end
    end
  end
end
