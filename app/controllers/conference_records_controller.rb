class ConferenceRecordsController < ApplicationController
  before_action :set_conference_record, only: [:show, :edit, :update, :destroy]
  before_action :def_values, only: [:new, :create, :edit, :update]

  include FileHelper
  include VueHelper

  respond_to :html, :js

  def index
    @conferences = Conference.where(parent_id: 0)
    @conference_records = ConferenceRecord.by_folder(params[:folder])
    respond_with(@conference_records)
  end

  def show
    respond_with(@conference_record)
  end

  def new
    @conference_record = ConferenceRecord.new
    respond_with(@conference_record)
  end

  def edit
  end

  def create
    @conference_record = ConferenceRecord.new(conference_record_params)
    @conference_record.save
    respond_with(@conference_record, location: conference_records_path)
  end

  def update
    @conference_record.update(conference_record_params)
    respond_with(@conference_record, location: conference_records_path)
  end

  def destroy
    @conference_record.destroy
    respond_with(@conference_record)
  end

  private
    def def_values
      @users   = User.order(:username).map{|u| {name: u.username, id: u.id}}
      @folders = Conference.order(:name)
      @folder  = @conference_record&.folder
      @files   = @conference_record&.attachments&.order(:created_at)
      @owner   = @conference_record
      # @departments = Department
    end

    def set_conference_record
      @conference_record = ConferenceRecord.find(params[:id])
    end

    def conference_record_params
      params.require(:conference_record).permit(:name, :description, :folder_id, :user_id, :department_id, :admin, :date_create, :date_update)
    end
end
