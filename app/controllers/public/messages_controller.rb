class Public::MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.all
  end

end

#   def new
#     @message = Message.new
#   end

#   def create
#     @message = Message.new(message_params)
#     @message.save
#     redirect_to admin_message_path(@message.id)
#   end

#   def show
#     @message = Message.find(params[:id])
#   end

#   def edit
#     @message = Message.find(params[:id])
#   end

#   def update
#     @message = Message.find(params[:id])
#     @message.update(message_params)
#     redirect_to admin_message_path(@message.id)
#   end

#   def destroy
#     @message = Message.find(params[:id])
#     @message.destroy
#     redirect_to admin_root_path
#   end

# private
#   def message_params
#     params.require(:message).permit(:title, :information)
#   end


# #  def new
# #   @item = Item.new
# #   end

# #   def create
# #   @item = Item.new(item_params)
# #   @item.save
# #   redirect_to admin_item_path(@item.id)
# #   end

# #   def index
# #   @items = Item.all
# #   @items = Item.page(params[:page]).per(10)
# #   @genres = Genre.all
# #   end

# #   def show
# #   @post_image = PostImage.new
# #   @item = Item.find(params[:id])
# #   @items = Item.all
# #   end

# #   def edit
# #     @item = Item.find(params[:id])
# #   end

# #   def update
# #     @item = Item.find(params[:id])
# #     @item.update(item_params)
# #     redirect_to admin_item_path(@item.id)
# #   end

# #   private

# #   def item_params
# #     params.require(:item).permit(:name, :introduction, :price, :is_active, :profile_image, :genre_id)
# #   end

# #   def genre_params
# #     params.require(:genre).permit(:name)
# #   end

# #   end
