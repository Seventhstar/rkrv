class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update, :index]
  before_action :logged_in_user
  respond_to :html

  include RolesHelper
  include AccessHelper

  def index
    if params[:date_start].present? && params[:date_end].present?
      dt_start = Date.parse(params[:date_start])
      dt_end   = Date.parse(params[:date_end])
      @expenses = Expense.where('date >= ? and date <= ?', dt_start, dt_end)
    else
      @expenses = Expense.all
    end

    @departments = Department.order(:name)
    @safes = Safe.order(:name)

    if !is_admin?
      @expenses = @expenses.where(user_id: current_user.id)
    end

    @json_expenses = @expenses.order(date: :desc).map{|e| {
      id: e.id, 
      date: e.date.try('strftime',"%d.%m.%Y"),
      sortdate: e.date,
      month: t(e.date.try('strftime',"%B")) + " " + e.date.try('strftime',"%Y"),
      safe: e.safe&.name,
      amount: e.amount,
      department: e.department&.name,
      expense_type: e.expense_type&.name,
      user: e.user&.name,
      editable: allow_edit(e, e.date),
      comment: e.comment
    }}

    respond_with(@expenses)
  end

  def show
    respond_with(@expense)
  end

  def new
    @expense = Expense.new
    @expense.date = Date.today
    @expense.user_id = current_user.id
    @expense.safe_id = current_user.safe_id
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
    flash[:error] = @expense.errors.full_messages if @expense.errors.any?
    respond_with(@expense, location: expenses_path)
  end

  def destroy
    @expense.destroy
    respond_with(@expense)
  end

  private
    def def_values
      @safes = Safe.order(:name)
      @users = User.order(:username)
      @organisations = Organisation.actual.order(:name)
      @departments = Department.order(:name)
      @expense_types = ExpenseType.order(:name)
      if current_user.present?
        @owned_safes = current_user.safes.pluck(:id)
        @user_safe = current_user.safe_id
        @salary_rows = @expense.expense_salary_rows.map{|s| { id: s.id,
          staff: { label: s.staff_name, value: s.staff_id }, 
          amount: s.amount, comment: s.comment, _destroy: false}} if @expense.present?
      end
    end

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:date, :amount, :safe_id, :expense_type_id, 
                    :department_id, :comment, :user_id, :organisation_id,
                     expense_salary_rows_attributes: [:id, :staff_id, :amount, :comment, :_destroy])
    end
end
