class CsvController < ApplicationController
  require 'csv'

  def import_products
  end
  
  def upload_products
    @col_index = 2
    @data = [] 

    CSV.foreach(params[:upload][:csv].tempfile, col_sep: "\t") do |row|
      puts row[0]
      found = Product.find_by(code1c: row[0])
      Product.create!({name: row[1], code1c: row[0]}) if !found
      # if row[0] != nil && row[1]==nil
      #   if @gr.index(row[0]) == nil
      #    @gr<<row[0]
      #   end
      # end
    end

    redirect_to products_path
  end

end
