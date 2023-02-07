class Admin::HomesController < ApplicationController

  def top
    @messages = Message.all
    @messages = Message.page(params[:page]).per(2)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_root_path
  end

end