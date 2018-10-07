module Merchant
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :merchant_only
    before_action :get_company

    def index
      @users = User.where(role: 'user')
    end

    def show
      @user = User.find(params[:id])
      @payments = @user.payments.order('created_at desc')
      unless current_user.admin? || current_user.role == 'merchant'
        unless @user == current_user
          redirect_to root_path, :alert => "Access denied."
        end
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    end

    private

    def merchant_only
      unless current_user.admin? || current_user.role == 'merchant'
        redirect_to new_user_session_path, :alert => "Access denied."
      end
    end

    def secure_params
      params.require(:user).permit(:role)
    end

  end
end