class Public::HomesController < ApplicationController

  def top
    @messages = Message.limit(6).order('id DESC')
    @impressions = Impression.where(created_at: (Time.zone.today.beginning_of_day - 30.day)..Time.zone.today.end_of_day)
    @impressions = @impressions.limit(6).order('id DESC')
    # @name = @impressions.customer 投稿者の名前が出るようにしたい
  end

  def about
  end
end
