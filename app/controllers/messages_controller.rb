class MessagesController < ApplicationController
  def create
    new_msg = current_user.messages.create! params_message

    if new_msg.conversation.sender_id == current_user.id
      receiver_id = new_msg.conversation.receiver_id
    else
      receiver_id = new_msg.conversation.sender_id
    end
    @messages = new_msg.conversation.messages

    ConversationBroadcastJob.perform_now(receiver_id, @messages)

    respond_to do |format|
      format.js
    end
  end

  private

  def params_message
    params.require(:message).permit(:content, :conversation_id)
  end
end
