class AjaxController < ApplicationController
  respond_to :html, :json
  skip_before_action :verify_authenticity_token
  before_action :logged_in_user
  def get_active_products
    @products = Product.active.map{|p| {id: p.id, name: p.name_with_mobile_uom_name}}

    # puts "@products #{@products}"
    respond_with(@products)
  end

  def switch_check
    if params[:model] == 'UserRole'
      item = UserRole.where(user_id: params[:item_id], role_id: params[:field])
      if params[:checked] == 'true'
        item = UserRole.new
        item.user_id = params[:item_id]
        item.role_id = params[:field]
        item.save
      else
        item.destroy_all
      end

    elsif params[:model]
      item = params[:model].classify.constantize.find(params[:item_id])
      if !item.nil?
        item[params[:field]] = params[:checked]
        item.save
      end
    end
    head :ok
  end


  def post_leftovers
    # puts "params: ", params

    data = params
    # puts "data[store_id] #{data['store_id']}"
    store_id = data['storageId']
    # puts "data[counts] #{data['counts']}"
    data['productForUpload'].each do |c|
      puts "co #{c} - #{c['product_id']}"
      fnd = ProductLeftover.find_or_create_by(product_id: c['id'], store_id: store_id, date: Date.today)
      fnd.count = c['count']
      fnd.save 
    end

    head :ok
  end


  private
    def leftover_params
      params.require(:leftovers).permit(:store_id, counts: [:product_id, :date, :count])
    end
end
