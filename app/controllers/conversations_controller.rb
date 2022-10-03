class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_conversation, only: :show
  before_action :check_conversation_of_user, only: :show

  def index
    @users = User.all
  end

  def create
    conversation = Conversation.get_by_sender_and_receiver_id(params_conversations[:receiver_id], current_user.id).first

    conversation = Conversation.create params_conversations.merge(sender_id: current_user.id) if conversation.blank?

    redirect_to conversation_path(conversation)
  end

  def show
    if @conversation.sender_id == current_user.id
      @other = @conversation.receiver
    else
      @other = @conversation.sender
    end

    @messages = @conversation.messages
    @message = Message.new
  end

  private

  def params_conversations
    params.require(:conversation).permit :receiver_id
  end

  def load_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_conversation_of_user
    return if current_user.id == @conversation.receiver_id || current_user.id == @conversation.sender_id

    redirect_to root_path
  end
end
