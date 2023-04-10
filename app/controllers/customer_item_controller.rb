class CustomerItemController < ApplicationController
  def create
    customer_item = CustomerItem.new(params)
    redirect_to "/customers/#{customer_item.customer.id}"

    @recipe = Recipe.new(params[:recipe])
    if (params[:tags])
      @recipe.tags << params[:tags]
    end
  end

  private
  def customer_item_params
    params.permit(:customer_id, :item_id)
  end
end