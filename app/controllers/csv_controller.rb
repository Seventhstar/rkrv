class CsvController < ApplicationController
  require 'csv'
  before_action :logged_in_user

  def import_products
  end
  
  def upload_products
    @col_index = 2
    @data = [] 

    CSV.foreach(params[:upload][:csv].tempfile, col_sep: "\t") do |row|
      puts row[0]
      found = Product.find_by(code1c: row[0])
      Product.create!({name: row[1], code1c: row[0]}) if !found
    end

    redirect_to products_path
  end

  def upload_catalog
    return if params[:upload][:model] == 'user'

    _obj  = params[:upload][:model].classify.constantize
    fields = params[:upload][:fields].split(',').map{|f| f.strip}
    key  = fields[0]

    if fields.include?('organisation')
      
      CSV.foreach(params[:upload][:csv].tempfile, col_sep: "\t") do |row|
        # found = _obj.find_by(key: row[0])
        found = _obj.find_by(code1c: row[0])
        # found = false
        org_id = Organisation.where('code1c like ?', "%#{row[2]}%").first.id
        # _obj.create!({code1c: row[0], name: row[1], organisation_id: org_id, department_code: row[3]}) if !found
        _obj.create!({code1c: row[0], name: row[1], organisation_id: org_id, safe_type_id: row[3]}) if !found
      end
    else
      CSV.foreach(params[:upload][:csv].tempfile, col_sep: "\t") do |row|
        found = _obj.find_by(code1c: row[0])
        # found = _obj.find_by(key: row[0])
        if !found
          fieldmap = {}
          fields.each_with_index.map{|f, i| fieldmap[f] = row[i]} 
          _obj.create!(fieldmap) 
        end
      end
    end

    redirect_to "/admin/#{params[:upload][:model].pluralize}"
  end


end
