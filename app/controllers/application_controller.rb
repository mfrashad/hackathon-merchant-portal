class ApplicationController < ActionController::Base
  def get_company
    @company = current_user&.company
  end
end
