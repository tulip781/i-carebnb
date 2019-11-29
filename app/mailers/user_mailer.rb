# class UserMailer < ApplicationMailer
#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.user_mailer.welcome.subject
#   #


#   def welcome_for_charity
#     @charity_greeting = "Hi, charity"
#     user = User.first
#     UserMailer.with(user: user).welcome_for_charity

#     mail to: "to@example.org"
#   end

#   def welcome_for_host
#     @host_greeting = "Hi, host"
#     user = User.first
#     UserMailer.with(user: user).welcome_for_host


#   end

#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.user_mailer.chat_replicator.subject
#   #
#   def chat_replicator
#     @chat_replication = "You've been sent a message.  Please go to your chatroom!  The message is from says: chat_message"
#     user = User.first
#     # don't understand why this is User.first
#     chat = Chat.first
#     # done this by analogy but don't understand why this is .first.
#     UserMailer.with(user: @interlocutor, chat: @chat).chat_replicator
#     # this needs to be

#     mail to: "to@example.org"
#   end
# end
