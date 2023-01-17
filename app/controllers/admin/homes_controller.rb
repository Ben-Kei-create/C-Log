class Admin::HomesController < ApplicationController

  def top
    @messages = Message.all
    #@message = Message.page(params[:page]).per(10)
  end
end