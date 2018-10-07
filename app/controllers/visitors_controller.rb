class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role == 'merchant' || current_user.admin?
      redirect_to merchant_root_path
    end
  end
end
