class ConversationDecorator
  attr_accessor :current_user, :update

  def initialize(user)
    @current_user = user
    @update = false
  end

  def convos
    @convos ||= User.all.map { |user| Conversation.between(current_user, user) }
      .flatten
  end

  def updated?
    convos.select { |convo| convo.new_messages? }.any?
  end
end
