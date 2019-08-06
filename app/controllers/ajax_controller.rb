class AjaxController < ApplicationController
  respond_to :html, :json

  def get_active_products
    @products = Product.active.to_json(only: [:id, :name])
    respond_with(@products)
  end
end
