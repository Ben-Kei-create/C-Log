class Admin::MessagesController < ApplicationController
#管理者が、会員へ連絡するためのMessage機能です。

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to admin_message_path(@message.id)
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to admin_message_path(@message.id)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_root_path
  end

private
  def message_params
    params.require(:message).permit(:title, :information)
  end
end