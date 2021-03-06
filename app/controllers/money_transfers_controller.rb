class MoneyTransfersController < ApplicationController
  before_action :set_money_transfer, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update, :index]
  before_action :logged_in_user
  # respond_to :html
  respond_to :html, :json, :js
  include DatesHelper
  include RolesHelper
  include AccessHelper

  def index
    if params[:date_start].present? && params[:date_end].present?
      dt_start = Date.parse(params[:date_start])
      dt_end   = Date.parse(params[:date_end])
      @money_transfers = MoneyTransfer.where('doc_date >= ? and doc_date <= ?', dt_start, dt_end)
    else
      @money_transfers = MoneyTransfer.all
    end
    
    @money_transfers = @money_transfers.where(user_id: current_user.id) if !is_admin?

    @columns = %w"doc_date id money_transfer_type_id safe_from_id safe_to_id amount user_id comment"
    fields  = %w"".concat(@columns)
    
    @json_data = []
    @filterItems = %w'priority user'

    @money_transfers.order(doc_date: :desc).each do |mt| 
      h = {id: mt.id, month: month_year(mt.doc_date), editable: allow_edit(mt, mt.doc_date)}
      
      fields.each do |col|
        c = col.include?(":") ? col.split(':')[0] : col.downcase
        h[c] = mt[c]
        if c.end_with?("_id")
          n = c[0..-4]
          h[n] = mt.try(n).try("name")
        end
      end
      @json_data.push(h)
    end
    
    respond_with(@money_transfers)
  end

  def show
    respond_with(@money_transfer)
  end

  def new
    @money_transfer = MoneyTransfer.new
    @is_admin = current_user.admin
    @money_transfer.doc_date = Date.today
    @money_transfer.money_transfer_type_id = 3 
    @money_transfer.user = current_user
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
    if @money_transfer.destroy
      head 200, content_type: "text/html"
    else
    end
  end

  private
    def def_values
      @users = User.order(:username).map{|u| {id: u.id, name: u.username.present? ? u.username : u.email, safe: u.safe_id}}
      @safes = Safe.actual.order(:name)

      @safe_tos = Safe.actual.order(:name)
      @safe_froms = Safe.actual.order(:name)
      @organisations = Organisation.actual.order(:name)
      @money_transfer_types = MoneyTransferType.order(:name) 
      @safe_links = SafeLink.all

      if current_user.present?
        @user_safe = current_user.safe_id
        @owned_safes = current_user.safes + current_user.accounts
      end
    end

    def set_money_transfer
      @money_transfer = MoneyTransfer.find(params[:id])
    end

    def money_transfer_params
      params.require(:money_transfer).permit(:doc_date, :amount, :comment, 
                                             :safe_from_id, :safe_to_id, 
                                             :o_from_id, :o_to_id,                                             
                                             :user_id, :money_transfer_type_id)
    end
end
