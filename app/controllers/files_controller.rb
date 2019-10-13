class FilesController < ApplicationController
  require 'uri'
  respond_to :html, :json
  before_action :logged_in_user

  def destroy
    if params[:id] && current_user.has_role?(:manager)
      @file = Attachment.find(params[:id])
      num_to_s = @file.owner_id.to_s
      filename = Rails.root.join('public', 'uploads',@file.owner_type,num_to_s,@file.id.to_s+File.extname(@file.name))
      File.delete(filename) if File.exist?(filename)
      @file.destroy
    end
    render nothing: true
  end

  def create
    if params[:files]

      if params[:owner_id] == ''
        folder = 'cache'
        subfolder = params[:owner_cache]
      else      
        folder = params[:owner_type].classify
        subfolder = params[:owner_id]
      end
      uploaded_io = params[:files]

      name = uploaded_io.original_filename
      dir = Rails.root.join('public', 'uploads', folder, subfolder)
      # puts "dir #{dir}"
      FileUtils.mkdir_p(dir) unless File.exists?(dir)
      id = append_file(name)
      open(dir+(id.to_s+File.extname(name)), 'wb') do |file|
        file.write(uploaded_io.read)
      end

      @cls = params[:owner_type].to_s
      # puts "cls = #{@cls} #{params[:owner_type]}"
    end
   # render layout: false, content_type: "text/html"
 end

  def append_file(filename) #,lead_id
    @file = Attachment.new
    @file.owner_id   = params[:owner_id]  
    @file.owner_type = params[:owner_type].classify
    @file.user_id    = current_user.id
    @file.name       = filename
    #@file.secret     = current_user.has_role?(:manager)
    @file.save
    # puts "errors #{@file.errors.full_messages}"
    @file.id

  end

  def show
    file = Attachment.find(params[:id])
    @file_id = params[:id]
    @ext = File.extname(file.name)
    # puts "File.extname(file.name) #{File.extname(file.name)}" 
    @dir = Rails.root.join('public', 'uploads', file.owner_type, file.owner.id.to_s, file.id.to_s+File.extname(file.name))
    # if File.extname(file.name) == "pdf"
    #   dir = Rails.root.join('public', 'uploads', file.owner_type, file.owner.id.to_s, file.id.to_s+File.extname(file.name))
    #   send_file(dir, filename: file.name, type: 'application/pdf', disposition: :inline)
    # else
      @img = "/download/#{params[:id]}"
      respond_modal_with @img, location: root_path
    # end
  end

  def download
    file = Attachment.find(params[:id])
    @ext = File.extname(file.name)
    dir = Rails.root.join('public', 'uploads', file.owner_type, file.owner.id.to_s, file.id.to_s+File.extname(file.name))
    send_file(dir, filename: file.name, disposition: 'attachment')
  end

end
