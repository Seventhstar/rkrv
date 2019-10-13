class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  def new
    @conference = Conference.new
    @parents = Conference.order(:name)
  end

  def edit
    @parents = Conference.order(:name)
  end

  def create
    @conference = Conference.new(conference_params)
    @conference.save
    respond_with(@conference, location: conference_records_path)
  end

  def update
    @conference.update(conference_params)
    respond_with(@conference)
  end

  def destroy
    @conference.destroy
    respond_with(@conference)
  end

  private
    def set_conference
      @conference = Conference.find(params[:id])
    end

    def conference_params
      params.require(:conference).permit(:name, :description, :parent_id, :user_id, :department_id, :admin, :date_create, :date_update)
    end

end
