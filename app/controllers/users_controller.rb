class UsersController < ApplicationController
  before_filter :authenticate_user!

  def search
    query = "%#{params[:q]}%"
    @users = User.where("name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         email LIKE ?",
                         query,query,query,query,query).all
  end

  def show
    @user = User.find(params[:id])
  end

  def inbox
    @my_conversations = current_user.mailbox.conversations

    if not @my_conversations.empty?
      @messages_first_conv = @my_conversations.first.receipts_for current_user
    end
  end


  def new_message
    @receiver = User.find(params[:id])

    if request.post?
      puts "RECEIVER:"
      puts @receiver


      current_user.send_message(@receiver, params[:body], "Subject")


      redirect_to @receiver, notice: "Message successfully sent. :)"
    else
      puts "SHOW FORM????"
    end

  end
end
