# app/controllers/dashboard_controller.rb

class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      
      @groups = current_user.groups
      @transactions = current_user.financial_transactions
    end
  end
  