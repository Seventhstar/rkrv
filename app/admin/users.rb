ActiveAdmin.register User do
  permit_params :email, :password, :safe_id, :username, :approved, :admin,
                :password_confirmation, :reset_password_token,
                :reset_password_sent_at, :remember_created_at, :role_ids => []

  menu parent: 'Пользователи', label: 'Пользователи'

  index do
    selectable_column
    column :username
    column :email
    column :admin
    column :safe
    actions 
  end
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
      f.input :username, label: 'Имя:'
      f.input :email
      f.input :password, label: 'Пароль:'
      f.input :approved, label: 'Активен'
      f.input :admin,    label: 'Админ'
      f.input :code1c,   label: 'Код 1С:'
      # f.input :password_confirmation
      f.input :safe_id, label: 'Сейф', as: :select, collection: Safe.all
      f.input :roles, as: :check_boxes, foreign_key: :user_id, collection: Role.all.map{ |s| [s.name, s.id] }, label: 'Роли'
    end
    f.actions
  end


end
