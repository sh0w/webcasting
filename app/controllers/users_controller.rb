class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  respond_to :json, :js

  def search
    query = "%#{params[:q]}%"
    @users = User.where("name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         skills LIKE ? OR
                         email LIKE ?",
                         query,query,query,query,query,query).all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_message
    params[:id]
    @my_conversations = current_user.mailbox.conversations
    @my_conversations.each do |conv|
      if conv.id === params[:id].to_i
        @show_conv = conv
        break
      end
    end

    respond_to do |format|
      format.js{render :partial => 'show_message'}
    end
  end


  def inbox
    #show all conversations (not just the inbox)
    #?? gibt es einen besseren weg ohne doppelten einträgen arbeiten zu müssen???
    @my_conversations = current_user.mailbox.inbox
    @my_conversations.concat(current_user.mailbox.sentbox)
    @newest_conversation = current_user.mailbox.conversations.first
  end


  def new_message
    conversations = current_user.mailbox.conversations
    @old_conv = nil

    if not conversations.empty?
      conversations.each do |conv|
        conv.receipts_for(current_user).each do |r|
          if r.message.sender.id === params[:id].to_i
              @old_conv = conv
            break
          end
        end
      end
    end

    @receiver = User.find(params[:id])

    if request.post?
      puts "RECEIVER:"
      puts @receiver

      if @old_conv.nil?
        current_user.send_message(@receiver, params[:body], params[:subject])
      else
        current_user.reply_to_conversation(@old_conv, params[:body])
      end

      redirect_to @receiver, notice: "Message successfully sent. :)"
    else
      puts "SHOW FORM????"
    end

  end
end
