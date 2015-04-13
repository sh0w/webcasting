class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  prepend_before_filter :require_no_authentication, only: [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]

# GET /resource/edit
  def edit
    @user = User.find(current_user.id)

    @show_in_search = "Please fill out your name to show up in our search results."

    if not @user.name.blank?
      @show_in_search = ""
    end

    render :edit
  end
# PUT /resource
# We need to use a copy of the resource because we don't want to change
# the current user in place.

  def update

    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
                           else
                             # remove the virtual current_password attribute
                             # update_without_password doesn't know how to ignore it
                             params[:user].delete(:current_password)
                             @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        #format.json { head :no_content }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        #format.json { render :json => @user.errors, :status => :unprocessable_entity }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
        params[:user][:password].present? ||
        params[:user][:password_confirmation].present?
  end

end