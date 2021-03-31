class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_params, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

def purchase_params
  params.require(:purchase_address).permit(:post_code,:shipping_area_id, :municipality, :address, :building, :telephone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
end



def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency:'jpy'
  )
end

def find_params
  @item = Item.find(params[:item_id])
end

def move_to_top
  if @item.user_id == current_user.id || @item.purchase.present?
    redirect_to root_path
  end
end

end
