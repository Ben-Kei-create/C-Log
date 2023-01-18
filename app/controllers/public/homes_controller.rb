class Public::HomesController < ApplicationController
  def top
    @messages = Message.limit(3).order('id DESC')
  end

  def about
  end
end
