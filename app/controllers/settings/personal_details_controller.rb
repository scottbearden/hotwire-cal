class Settings::PersonalDetailsController < Settings::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_settings_personal_details_path, notice: "Personal details updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :handle, :timezone)
  end
end
