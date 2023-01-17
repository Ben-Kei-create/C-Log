class Admin::MessagesController < ApplicationController

  def new
   @message = Message.new
  end

  def create
   @message = Message.new(message_params)
   @message.save
   redirect_to admin_root_path
  end

private
  def message_params
    params.require(:message).permit(:title, :information)
  end
end
