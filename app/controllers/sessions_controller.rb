class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token,
                        if: Proc.new { |c| c.request.format == 'application/json' }
  def new

  end

  def valid_session
    controller.stub!(:authorize).and_return(User)
  end
  
  def create

    if request.format == 'application/json'
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
      # if success
        # puts "user #{user.as_json}"
        current_user = user
        render json: user.as_json(only: [:email, :token]), status: :created  
      else
        # head :unauthorized
        errors = { error: 'Неправильный логин или пароль' }
        render json: errors, status: :unauthorized
      end
    else

      user = User.find_by(email: params[:session][:email])
        puts "user #{user}"
      if user && user.authenticate(params[:session][:password])
        puts "user #{user}"
        if user.approved
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
   
          # default_url = current_user.has_role?(:designer) ? :projects : :leads

          if session[:forwarding_url] == root_url 
            redirect_to root_url
          else
            redirect_back_or root_url
          end
        else
          message  = "Аккаунт не активирован. "
          puts "message #{message}"
  #        message += "Проверьте свой почтовый ящик на наличие ссылки активации."
          flash[:warning] = message
          redirect_to root_url
        end
      else
        puts "Неверная комбинация email/пароль."
        flash.now[:danger] = 'Неверная комбинация email/пароль.'
        render 'new'
      end
    end
  end
  
  def destroy
    current_user.update_token
    log_out if logged_in?
    redirect_to root_url
  end
end
