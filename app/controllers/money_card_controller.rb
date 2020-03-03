class MoneyCardController < ApplicationController
  before_action :logged_in_user
  include DatesHelper

  def index
    s_id  = params[:s_id]
    o_id  = params[:o_id]

    @json_data     = []

    @current_month = Date.today.beginning_of_month 
    @current_month = Date.parse(params['month']) if !params['month'].nil?
    puts "@current_month #{@current_month}"


    @start = Leftover.on_date(s_id, o_id, @current_month)

    out_e = Expense.where("date_trunc('month', date) = ? AND safe_id = ? AND organisation_id = (?)", 
                @current_month, s_id, o_id)

    out_mt = MoneyTransfer.where("date_trunc('month', doc_date) = ? AND safe_from_id = ? AND o_from_id = (?)", 
                @current_month, s_id, o_id)
    # iin   = 0
    iin   = MoneyTransfer.where("date_trunc('month', doc_date) = ? AND safe_to_id = ? AND o_to_id = (?)", 
                @current_month, s_id, o_id)

    handle_docs(out_e, -1)
    handle_docs(out_mt, -1)
    handle_docs(iin)

    @json_data = @json_data.sort_by { |hsh| hsh[:doc_date] }

    # puts "out_e #{out_e.length}, #{iin.length}"

    @columns = %w"id doc_date doc_type amount end_leftover from to user_id comment"
    fields  = %w"".concat(@columns)


  end

  private

    def handle_docs(docs, factor = 1)

      docs.each do |d|
        @json_data.push({
          month: month_year(@current_month),
          id: d.id,
          doc_type: t(d.class.name),
          doc_date: d.try('date'),
          from: d.from,
          to: d.to,
          amount: d.amount*factor,
          user: d.user&.name,
          comment: d.comment
        })
        # wefk
      end
    end

end
