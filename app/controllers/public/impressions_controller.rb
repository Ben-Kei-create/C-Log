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

private

  def impression_params
      params.require(:impression).permit(:best_movie, :recommend_movie)
  end
end

#   def edit
#     @impression = Impression.new
#   end

#   def update
#     @impression = Impression.find(params[:id])
#     Impression.update
#   end


# end

#  def new
#   @item = Item.new
#   end



#   def index
#   @items = Item.all
#   @items = Item.page(params[:page]).per(10)
#   @genres = Genre.all
#   end

#   def show
#   @post_image = PostImage.new
#   @item = Item.find(params[:id])
#   @items = Item.all
#   end

#   def edit
#     @item = Item.find(params[:id])
#   end

#   def update
#     @item = Item.find(params[:id])
#     @item.update(item_params)
#     redirect_to admin_item_path(@item.id)
#   end


#   def item_params
#     params.require(:item).permit(:name, :introduction, :price, :is_active, :profile_image, :genre_id)
#   end

#   def genre_params
#     params.require(:genre).permit(:name)
#   end

#   end
