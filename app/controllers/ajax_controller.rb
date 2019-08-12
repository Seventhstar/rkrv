class AjaxController < ApplicationController
  respond_to :html, :json
  skip_before_action :verify_authenticity_token

  def get_active_products
    @products = Product.active.to_json(only: [:id, :name])
    puts "@products #{@products}"
    respond_with(@products)
  end

  def post_leftovers
    puts "params: ", params

    data = leftover_params
    puts "data[store_id] #{data['store_id']}"
    store_id = data['store_id']
    # puts "data[counts] #{data['counts']}"
    data['counts'].each do |c|
      puts "co #{c[1]} - #{c[1]['product_id']}"
      fnd = ProductLeftover.find_or_create_by(product_id: c[1]['product_id'], store_id: store_id, date: Date.today)
      fnd.count = c[1]['count']
      fnd.save 
    end

    head :ok
  end


  private
    def leftover_params
      params.require(:leftovers).permit(:store_id, counts: [:product_id, :date, :count])
    end
end
