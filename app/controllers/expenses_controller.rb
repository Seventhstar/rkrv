class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update]
  respond_to :html

  def index
    if params[:date_start].present? && params[:date_end].present?
      dt_start = Date.parse(params[:date_start])
      dt_end   = Date.parse(params[:date_end])
      @expenses = Expense.where('date >= ? and date <= ?', dt_start, dt_end)
    else
      @expenses = Expense.all
    end
    respond_with(@expenses)
  end

  def show
    respond_with(@expense)
  end

  def new
    @expense = Expense.new
    @expense.date = Date.today
    @expense.user_id = current_user.id
    respond_with(@expense)
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    flash[:error] = @expense.errors.full_messages if @expense.errors.any?
    respond_with(@expense, location: expenses_path)
  end

  def update
    @expense.update(expense_params)
    respond_with(@expense, location: expenses_path)
  end

  def destroy
    @expense.destroy
    respond_with(@expense)
  end

  private
    def def_values
      # safes = Safe.order(:name)
      # departments = Department.order(:name)
      # expense_types = ExpenseType.order(:name)
      @users = User.order(:username)

    end

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:date, :amount, :safe_id, :expense_type_id, :department_id, :comment, :user_id)
    end
end
