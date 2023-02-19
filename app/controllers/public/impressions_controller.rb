class Public::ImpressionsController < ApplicationController

  def new
    @impression = Impression.new
  end

  def create
    @impression = current_customer.impressions.build(impression_params)
    if @impression.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @impression = Impression.find(params[:id])
  end

  def index
  @impression = Impression.where(created_at: (Time.zone.today.beginning_of_day - 30.day)..Time.zone.today.end_of_day)
  @impression = @impression.page(params[:page]).per(10)
  end

private
  def impression_params
      params.require(:impression).permit(:best_movie, :recommend_movie, :created_at, :updated_at)
  end
end