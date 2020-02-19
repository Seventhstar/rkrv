class ProductLeftoversController < ApplicationController
  before_action :set_product_leftover, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  respond_to :html

  def index
    @product_leftovers = ProductLeftover.all
    respond_with(@product_leftovers)
  end

  def show
    respond_with(@product_leftover)
  end

  def new
    @product_leftover = ProductLeftover.new
    respond_with(@product_leftover)
  end

  def edit
  end

  def create
    @product_leftover = ProductLeftover.new(product_leftover_params)
    @product_leftover.save
    respond_with(@product_leftover)
  end

  def update
    @product_leftover.update(product_leftover_params)
    respond_with(@product_leftover)
  end

  def destroy
    @product_leftover.destroy
    respond_with(@product_leftover)
  end

  private
    def set_product_leftover
      @product_leftover = ProductLeftover.find(params[:id])
    end

    def product_leftover_params
      params.require(:product_leftover).permit(:product_id, :store_id, :date, :count)
    end
end
