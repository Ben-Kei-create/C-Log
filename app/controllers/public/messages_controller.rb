class Public::MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.all
    @messages = Message.page(params[:page]).per(15)
  end

end