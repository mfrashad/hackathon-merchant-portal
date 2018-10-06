class VisitorsController < ApplicationController
  before_action :authenticate_user!
  before_action :merchant_only

  def merchant_only
    unless current_user.role == 'merchant' || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
    redirect_to merchant_root_path
  end
end
