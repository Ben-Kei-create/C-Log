class Public::HomesController < ApplicationController

  def top
    @messages = Message.limit(4).order('id DESC')
    @impressions = Impression.where(created_at: (Time.zone.today.beginning_of_day - 30.day)..Time.zone.today.end_of_day)
    @impressions = @impressions.limit(4).order('id DESC')
  end

  def about
  end
end
