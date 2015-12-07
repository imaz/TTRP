# view
<% if current_user.admin? %>
  <%= current_user.message_for_admin(@message) %>
<% else %>
  <%= current_user.message_for_general(@message) %>
<% end %>

# app/models/user.rb
def message_for_admin message
  img_tag = '<img src="/assets/message/admin.png" />'
  span_tag = "<span>#{message.body}</span>"
  "<div>#{img_tag}#{span_tag}</div>"
end

def messsage_for_general message
  img_tag = '<img src="/assets/message/general.png" />'
  span_tag = "<span>#{message.body}</span>"
  "<div>#{img_tag}#{span_tag}</div>"
end
