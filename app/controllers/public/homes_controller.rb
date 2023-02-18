class Public::HomesController < ApplicationController

  def top
    @messages = Message.limit(6).order('id DESC')
    @impressions = Impression.all
    @impressions = Impression.limit(6).order('id DESC')
    # @name = @impressions.customer 投稿者の名前が出るようにしたい
  end

  def about
  end
end
