class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation
  def create

    #recipient_emails = conversation_params(:recipients).split(',')
    #recipients = User.where(email: recipient_emails).all

    recipient = User.find(conversation_params(:recipient).to_i)

    if current_user.send_message(recipient, *conversation_params(:body), "subject")
      redirect_to inbox_path
    else
      render :text => "problem".inspect
    end
  end
  def index
    @conversations ||= current_user.mailbox.inbox.all
  end
  def addForm

    @user = User.find(params[:id])

    if params[:id] != current_user.id
      conversations = current_user.mailbox.conversations

      @conv = nil

      if not conversations.empty?
        conversations.each do |conv|
          conv.receipts_for(current_user).each do |r|
            if r.message.sender.id == params[:id].to_i or r.message.recipients.first.id == params[:id].to_i
              @conv = conv
              break
            end
          end
        end
      end

      respond_to do |format|
        format.js { render partial: 'form' }
      end
    end

  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: conversation }
    end
  end
  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body))
    #redirect_to conversation_path(conversation)
    redirect_to inbox_path
  end
  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end
  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end
  private
  def mailbox
    @mailbox ||= current_user.mailbox
  end
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end
  def message_params(*keys)
    fetch_params(:message, *keys)
  end
  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
        when 0 then self
        when 1 then self[subkeys.first]
        else subkeys.map{|k| self[k] }
      end
    end
  end
end