class UsersController < ApplicationController
  before_action :logged_in_user
#, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  respond_to :html, :json


  # GET /users
  # GET /users.json
  def index
    redirect_to root_path
    @users = User.order(:name)
    @roles = Role.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  
  def new
    @user = User.new
    # @user.city = current_user.city
    respond_with @user, location: root_path
  end


  # GET /users/new
  def create
    @user = User.new(user_params)
    puts "user #{@user}"
    if @user.save
      @user.send_activation_email
      #flash[:info] = "На Ваш почтовый ящик отправлено письмо со ссылки на активацию аккаунта."
      redirect_to root_path
    else
      # puts "user: #{@user.errors.full_messages}"
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end
  
  def edit
    @cities = City.order(:id)
  end
  
  def update
    @user.create_reset_digest
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль обновлен"

      
      @user.options.destroy_all
      if params[:options]
        params[:options].each do |option|
          opt = @user.options.new
          opt.option_id = option
          opt.value = true
          opt.save
        end
      end
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render 'edit'
    end

  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to '/options/users'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def user_params
      params.require(:user).permit(:username, :date_birth, :email, :password, :telegram,
                                   :password_confirmation, :avatar, :safe_id, roles_ids: [:id, :_destroy] )
    end
    
    # Before filters
    
    # Confirms the correct user.
    def correct_user
      redirect_to(root_url) unless (current_user.id == params[:id].try(:to_i) || current_user.admin?)
      @user = User.find_by(id: params[:id])
      # redirect_to(root_url) unless current_user.admin?
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
