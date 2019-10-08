class MoneyRequestsController < ApplicationController
  before_action :set_money_request, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update]
  respond_to :html

  def index
    @money_requests = MoneyRequest.all
    respond_with(@money_requests)
  end

  def show
    respond_with(@money_request)
  end

  def new
    @money_request = MoneyRequest.new
    @money_request.date_start = Date.today.end_of_week+1.day
    @money_request.date_end = @money_request.date_start.end_of_week
    @money_request.user = current_user
    respond_with(@money_request)
  end

  def edit
  end

  def create
    @money_request = MoneyRequest.new(money_request_params)
    @money_request.save
    respond_with(@money_request)
  end

  def update
    @money_request.update(money_request_params)
    respond_with(@money_request)
  end

  def destroy
    @money_request.destroy
    respond_with(@money_request)
  end

  private
    def def_values
      @users = User.order(:username).map{|u| {name: u.username, id: u.id}}
    end

    def set_money_request
      @money_request = MoneyRequest.find(params[:id])
    end

    def money_request_params
      params.require(:money_request).permit(:date_start, :date_end, :user_id, :department_id, :amount_cash, :amount_bank)
    end
end
