class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update]
  before_action :logged_in_user
  respond_to :html

  def index
    @staffs = Staff.all
    respond_with(@staffs)
  end

  def show
    respond_with(@staff)
  end

  def new
    @staff = Staff.new
    respond_with(@staff)
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.save
    respond_with(@staff, location: staffs_path)
  end

  def update
    @staff.update(staff_params)
    respond_with(@staff, location: staffs_path)
  end

  def destroy
    @staff.destroy
    respond_with(@staff)
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def def_values
      @departments = Department.order(:name)
    end

    def staff_params
      params.require(:staff).permit(:name, :phone, :department_id, :in_date, :out_date, :birthday, :medbook)
    end
end
