class UserMailer < ActionMailer::Base
  default from: "noreply_coact@ufg.at"

  def send_blackboard_notification(user, post)
    #@user = user
    #@user.email
    @post = post
    mail( :to => 'katharina.gruber1@gmail.com',
          :subject => 'New blackboard entry!' )
  end

end
