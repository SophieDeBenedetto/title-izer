class ConversationsController < ApplicationController

  before_filter :authenticate_user!
 
  # layout false

  def index
    @update = false
    @convos = []
    @users = User.all 
    @users.each do |user|
      @convos << Conversation.between(current_user, user).first  
    end
    @convos.compact!
    @convos.each do |convo|
      @update = true if convo.messages.last.created_at > Time.now - 10.seconds
    end


    #check all convos that exist between current user and other users. 
    #if any have messages created in the last 10 seconds, replace little cirle with alert icon
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_path(@conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end



  private

    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end
  
end