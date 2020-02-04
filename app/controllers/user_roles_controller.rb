class UserRolesController < ApplicationController
  def index
    @users = User.order(:username)
    @roles = Role.order(:name)

  end
end
