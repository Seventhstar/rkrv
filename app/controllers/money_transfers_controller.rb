class MoneyTransfersController < ApplicationController
  before_action :set_money_transfer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @money_transfers = MoneyTransfer.all
    respond_with(@money_transfers)
  end

  def show
    respond_with(@money_transfer)
  end

  def new
    @money_transfer = MoneyTransfer.new
    @money_transfer.date = Date.today
    respond_with(@money_transfer)
  end

  def edit
  end

  def create
    @money_transfer = MoneyTransfer.new(money_transfer_params)
    @money_transfer.save
    respond_with(@money_transfer)
  end

  def update
    @money_transfer.update(money_transfer_params)
    respond_with(@money_transfer)
  end

  def destroy
    @money_transfer.destroy
    respond_with(@money_transfer)
  end

  private
    def set_money_transfer
      @money_transfer = MoneyTransfer.find(params[:id])
    end

    def money_transfer_params
      params.require(:money_transfer).permit(:date, :safe_from_id, :safe_to_id, :amount, :comment, :user_id)
    end
end
