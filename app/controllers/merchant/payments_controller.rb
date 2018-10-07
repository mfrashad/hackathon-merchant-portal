module Merchant
  class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :merchant_only
    before_action :get_company

    def index
      @payments = @company.payments.order('created_at desc')
    end

    private

    def merchant_only
      unless current_user.admin? || current_user.role == 'merchant'
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end
end