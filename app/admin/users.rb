ActiveAdmin.register User do
  permit_params :email, :password, :safe_id, :username, :approved, :admin,
                :password_confirmation, :reset_password_token, :code1c,
                :reset_password_sent_at, :remember_created_at, 
                :role_ids => [], :safe_ids => [], :account_ids => []

  menu parent: 'Пользователи', label: 'Пользователи'

  index do
    selectable_column
    column :username
    column :email
    column :admin
    column :safe
    column :token
    actions 
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :username, label: 'Имя:'
      f.input :email
      f.input :password, label: 'Пароль:'
      f.input :approved, label: 'Активен'
      f.input :admin,    label: 'Админ'
      f.input :code1c,   label: 'Код 1С:'
      f.input :safe_id, label: 'Сейф', as: :select, collection: Safe.all
      f.input :roles, as: :check_boxes, foreign_key: :user_id, collection: Role.all.map{ |s| [s.name, s.id] }, label: 'Роли'
      f.input :safes, as: :check_boxes, foreign_key: :owner_id, collection: Safe.where(safe_type_id: 2).order(:name).map{ |s| [s.name, s.id] }, label: 'Сейфы'
      f.input :accounts, as: :check_boxes, foreign_key: :user_id, 
              collection: Safe.where(safe_type_id: 3).actual.order(:name).map{ |s| [s.name, s.id] }, label: 'Р/ счета'
    end
    f.actions
  end


end
