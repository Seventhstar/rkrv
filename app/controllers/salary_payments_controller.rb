class SalaryPaymentsController < ApplicationController
  before_action :set_salary_payment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  respond_to :html

  def index
    @salary_payments = SalaryPayment.all
    respond_with(@salary_payments)
  end

  def show
    respond_with(@salary_payment)
  end

  def new
    @salary_payment = SalaryPayment.new
    respond_with(@salary_payment)
  end

  def edit
  end

  def create
    @salary_payment = SalaryPayment.new(salary_payment_params)
    @salary_payment.save
    respond_with(@salary_payment)
  end

  def update
    @salary_payment.update(salary_payment_params)
    respond_with(@salary_payment)
  end

  def destroy
    @salary_payment.destroy
    respond_with(@salary_payment)
  end

  private
    def set_salary_payment
      @salary_payment = SalaryPayment.find(params[:id])
    end

    def salary_payment_params
      params.require(:salary_payment).permit(:date, :depertment_id, :user_id, :amount)
    end
end
