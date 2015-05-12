class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  respond_to :json, :js

  def search
    query = "%#{params[:q]}%"
    @got_used = params[:skills_arr]

    @skills = Skill.all

    if @got_used.nil?
      @users = User.where("(users.name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         moreskills LIKE ? OR
                         email LIKE ?) AND users.name IS NOT NULL AND users.name <>''",
                                            query,query,query,query,query,query)
    else
      @users = User.includes(:skills).where("(users.name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         moreskills LIKE ? OR
                         email LIKE ?) AND users.name IS NOT NULL AND users.name <>'' AND skills.id IN (?)",
                               query,query,query,query,query,query,Skill.find(@got_used))
    end

  end

  def show
    @user = User.find(params[:id], :include => :skills)

    if params[:id].to_i != current_user.id.to_i
      if not params[:q].blank?
        query = "%#{params[:q]}%"

        @user_list = User.includes(:skills).where("(skills.name LIKE ? OR
                           users.name LIKE ? OR
                           city LIKE ? OR
                           country LIKE ? OR
                           description LIKE ? OR
                           moreskills LIKE ? OR
                           email LIKE ? ) AND users.name IS NOT NULL AND users.name <>''",
                                                        query,query,query,query,query,query,query).limit(10)
      else
        #@user_list = User.includes(:universities).where(User.arel_table[:id].not_in([params[:id],current_user.id])).limit(10)
      end

    end

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

    end

  end


  def favourites
    @users = current_user.find_voted_items
  end

  def show_message
    @my_conversations = current_user.mailbox.conversations
    @my_conversations.each do |conv|
      if conv.id === params[:id].to_i
        @show_conv = conv
        break
      end
    end
    @show_conv.mark_as_read(current_user)

    respond_to do |format|
      format.js{render :partial => 'show_message'}
    end
  end


  def inbox
    #show all conversations (not just the inbox)
    @my_conversations = current_user.mailbox.inbox.find(:all, :order => "updated_at")
    @my_conversations.concat(current_user.mailbox.sentbox.find(:all, :order => "updated_at"))

    if not @my_conversations.empty?
      @my_conversations = @my_conversations.sort_by(&:updated_at).reverse
      @my_conversations.first.mark_as_read(current_user)
    end
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
