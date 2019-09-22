ActiveAdmin.register User do
  permit_params :email, :password, :safe_id, :username, :approved, :admin,
                :password_confirmation, :reset_password_token, 
                :reset_password_sent_at, :remember_created_at


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :approved
      f.input :admin
      f.input :code1c
      # f.input :password_confirmation
       f.input :safe_id, label: 'Сейф', as: :select, collection: Safe.all
    end
    f.actions
  end


end
