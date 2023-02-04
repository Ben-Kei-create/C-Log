class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(10)  end
end