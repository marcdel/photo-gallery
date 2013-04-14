class LineItemsController < ApplicationController
  def create
    @photo_print = PhotoPrint.find(params[:photo_print_id])
    @line_item = LineItem.create!(cart: current_cart,
                                  photo_print: @photo_print,
                                  quantity: 1,
                                  price: @photo_print.print.price)
    flash[:notice] = "Added #{@photo_print.photo.title}: #{@photo_print.print.name} to cart."
    redirect_to cart_url current_cart
  end

  def destroy
    @photo_print = PhotoPrint.find(params[:photo_print_id])
    flash[:notice] = "Removed #{@photo_print.photo.title}: #{@photo_print.print.name} from cart."
    redirect_to cart_url current_cart
  end
end