ActiveAdmin.register AdminUser do
  # permit_params :email, :password, :username, :approved, :admin,
  #               :password_confirmation, :reset_password_token, 
  #               :reset_password_sent_at, :remember_created_at

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  #  index do
  #   column :email
  #   column :current_sign_in_at
  #   column :last_sign_in_at
  #   column :sign_in_count
  #   actions
  # end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs do
  #     f.input :username
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end

end
