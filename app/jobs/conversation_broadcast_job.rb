class ConversationBroadcastJob < ApplicationJob
  queue_as :default

  def perform receiver_id, messages
    ActionCable.server.broadcast "conversation:#{receiver_id}", layout: render_new_message(messages)
  end

  private

  def render_new_message messages
    ApplicationController.renderer.render(partial: "messages/messages", locals: {messages: messages})
  end
end
