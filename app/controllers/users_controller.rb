class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  respond_to :json, :js

  def search
    query = "%#{params[:q]}%"

    @users = User.includes(:universities).where("universities.name LIKE ? OR
                         users.name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         skills LIKE ? OR
                         email LIKE ?",
                         query,query,query,query,query,query,query).all
  end

  def show
    @user = User.find(params[:id], :include => :universities)

    if params[:id] != current_user.id
      conversations = current_user.mailbox.conversations

      @old_conv = nil

      if not conversations.empty?
        conversations.each do |conv|
          conv.receipts_for(current_user).each do |r|
            if r.message.sender.id == params[:id].to_i or r.message.recipients.first.id == params[:id].to_i
              @old_conv = conv
              break
            end
          end
        end
      end

    else
      #noch nicht getestet
      #@likes = @user.find_voted_items.compact.first(20)
    end

  end

  def show_message
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
    @my_conversations = current_user.mailbox.inbox.find(:all, :order => "updated_at")
    @my_conversations.concat(current_user.mailbox.sentbox.find(:all, :order => "updated_at"))
    @my_conversations = @my_conversations.sort_by(&:updated_at).reverse
  end

  def like
    @liked_user = User.find(params[:id])
    @liked_user.liked_by current_user
    redirect_to search_path
    #flash[:notice]="Liked!"
  end

  def unlike
    @liked_user = User.find(params[:id])
    @liked_user.unliked_by current_user
    redirect_to search_path
    #flash[:notice]="Unliked!"
  end

end
