module ApplicationHelper
  def unread_messages_count
    chats = []
    current_user.chatrooms.each { |chatroom| chats << chatroom.chats.where.not(user: current_user).where(read: false) }
    @unread_messages_received = chats.first.count
  end
end
