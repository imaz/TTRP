# mv app/assets/{,images/}message/admin.png
# mv app/assets/{,images/}message/general.png

# view
<%= @message.with_role_image(current_user) %>

# app/models/user.rb
class User < ActiveRecord::Base
  def role
    admin? ? 'admin' : 'general'
  end
end

# app/decorators/user_decorator.rb
module UserDecorator
  def role_image
    image_tag("message/#{role}.png")
  end
end

# app/decorators/message_decorator.rb
module MessageDecorator
  def with_role_image(user)
    content_tag(:div, user.role_image + content_tag(:span, message.body))
  end
end
