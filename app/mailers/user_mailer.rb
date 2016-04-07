class UserMailer < ActionMailer::Base
  default from: "noreply_coact@ufg.at"

  def send_blackboard_notification(post, user)
    #@user = user
    #@user.email
    @user = user
    @post = post
    mail( :to => 'katharina.gruber1@gmail.com',
          :subject => 'New blackboard entry!' )
  end

end
