class Admin::MessagesController < ApplicationController

  def new
   @message = Message.new
  end

  def create
   @message = Message.new(message_params)
   @message.save
   redirect_to '/admin'
  end

private
  def message_params
    params.require(:message).permit(:title, :information)
  end
end
