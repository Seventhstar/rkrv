class MoneyTransfersController < ApplicationController
  before_action :set_money_transfer, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update]
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
    respond_with(@money_transfer, location: money_transfers_path)
  end

  def update
    @money_transfer.update(money_transfer_params)
    respond_with(@money_transfer, location: money_transfers_path)
  end

  def destroy
    @money_transfer.destroy
    respond_with(@money_transfer)
  end

  private
    def def_values
      @users = User.order(:username).map{|u| {id: u.id, name: u.username.present? ? u.username : u.email}}
      @safe_tos = Safe.order(:name)
      @safe_froms   = Safe.order(:name)
      # puts "users: #{@users} #{@users.count}"
    end

    def set_money_transfer
      @money_transfer = MoneyTransfer.find(params[:id])
    end

    def money_transfer_params
      params.require(:money_transfer).permit(:date, :safe_from_id, :safe_to_id, :amount, :comment, :user_id)
    end
end
