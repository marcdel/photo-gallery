class LineItemsController < ApplicationController
  def create
    @print = Print.find(params[:print_id])
    @line_item = LineItem.create!(cart: current_cart, print: @print, quantity: 1, price: @print.price)
    flash[:notice] = "Added #{@print.name} to cart."
    redirect_to cart_url current_cart
  end

  def destroy
    @line_item = LineItem.find_by_print_id(params[:print_id]).destroy
    flash[:notice] = "Removed #{@line_item.print.name} from cart."
    redirect_to cart_url current_cart
  end
end