class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = current_user.mailbox.conversations.find(params[:id])
    current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(@conversation)+"#end"
  end
end
