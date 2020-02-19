class UserRolesController < ApplicationController
  before_action :logged_in_user

  def index
    @users = User.order(:username)
    @roles = Role.order(:name)

  end
end
