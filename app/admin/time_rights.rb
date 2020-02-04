ActiveAdmin.register TimeRight do

  menu parent: 'Пользователи', label: 'Ограничения по времени'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :model, :user_id, :days

  index do
    selectable_column
    column :modelname, title: 'Документ'
    column :username
    column :days
    actions
  end


  form do |f|
    f.inputs do
      f.input :model, label: 'Документ', as: :select, collection: TimeRight::MODELS
      f.input :user_id, label: 'Пользователь', as: :select, collection: User.actual.collect{|u| [u.name, u.id]}
      f.input :days, label: 'Дней'
    end
    f.actions
  end


end
