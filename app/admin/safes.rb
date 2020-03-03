ActiveAdmin.register Safe do
  menu parent: "Структура", label: 'Сейфы'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :code1c, :organisation_id, :department_code, :safe_type_id, :actual, 
                :from_ids => []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Сейф/Касса" do
      f.input :name
      f.input :code1c
      f.input :actual, label: 'Актуальный'
      f.input :organisation_id, label: 'Организация', as: :select, collection: Organisation.all
      f.input :safe_type_id, label: 'Тип сейфа/кассы', as: :select, collection: SafeType.all
      f.input :department_code
      f.input :froms, as: :check_boxes, foreign_key: :from_id, collection: Safe.actual.map{ |s| [s.name, s.id] }
      # f.input :roles, as: :check_boxes, foreign_key: :user_id, collection: Role.all.map{ |s| [s.name, s.id] }, label: 'Роли'
    end
    actions
  end  
end
