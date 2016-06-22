class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :add_conversation]
  
  def index
    @conversations = @mailbox.conversations.all
  end

  def show
    @messages = @conversation.messages.order("created_at")
     users = @conversation.participants
    if users.first != current_user
      @user = users.first 
    else 
      @user = users.second
    end
    @messages.each do |m|
      if m.sender_id == @user.id && m.is_unread?(current_user)
        m.mark_as_read(current_user) 
      end
    end
  end
  
  def add_conversation
    @opponent = User.find(params[:id])
    conv_check_1 = @opponent.mailbox.conversations
    conv_check_2 = @mailbox.conversations
    @dialog = (conv_check_1 & conv_check_2).first
    if @dialog.nil? or !@dialog.is_participant?(current_user)
      current_user.send_message(@opponent, params[:body], 'subject')
      conversation = @mailbox.conversations.order("created_at DESC").first
      redirect_to conversation_path(conversation)
    else
      current_user.reply_to_conversation(@dialog, params[:body])
      redirect_to conversation_path(@dialog)
    end
  end
  
  private
  
  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end