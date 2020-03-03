class LeftoversController < ApplicationController
  before_action :set_leftover, only: [:show, :edit, :update, :destroy]
  before_action :def_params, only: [:edit, :update, :new]
  before_action :logged_in_user
  
  include RolesHelper

  
  respond_to :html, :js

  def index
    @leftovers     = Leftover.all

    @current_month = Date.today.beginning_of_month 
    @current_month = Date.parse(params['m']) if !params['m'].nil?

    @organisations = Organisation.order(:name)
    @json_date     = []

    _where = {safe_type_id: 2, actual: true}
    _where[:id] = current_user.safe_id if just_manager?

    Safe.where(_where).each.collect{ |s|
      @organisations.each.collect{ |o|

        start = Leftover.on_date(s.id, o.id, @current_month)
        out   = Leftover.out(s.id, o.id, @current_month) 
        iin   = Leftover.in(s.id, o.id, @current_month)  

        iend  = start[:amount] + iin - out

        id    = start[:id].nil? ? 0 : start[:id]

        @json_date.push({
          id: id,
          organisation: o.name, 
          safe: s.name,
          start: start[:amount],
          in: iin, 
          out: out,
          editable: is_admin? && id>0,
          detail_link: money_card_index_path(o_id: o.id, s_id: s.id, month: @current_month),
          end: iend
        })
      }
    }

    respond_with(@leftovers)
  end

  def show
    respond_with(@leftover)
  end

  def new
    @leftover = Leftover.new 
    respond_with(@leftover)
  end

  def edit
  end

  def create
    @leftover = Leftover.new(leftover_params)
    @leftover.save
    flash[:error] = @leftover.errors.full_messages if @leftover.errors.any?      
    respond_with(@leftover, location: leftovers_path)
  end

  def update
    @leftover.update(leftover_params)
    flash[:error] = @leftover.errors.full_messages if @leftover.errors.any?      
    respond_with(@leftover, location: leftovers_path)    
  end

  def destroy
    @leftover.destroy
    respond_with(@leftover)
  end

  private
    def def_params
      @safes = Safe.where(safe_type_id: 2)
      @organisations = Organisation.all
    end

    def set_leftover
      @leftover = Leftover.find(params[:id])
    end

    def leftover_params
      params.require(:leftover).permit(:safe_id, :organisation_id, :calculated, :by_hand, :date)
    end
end
