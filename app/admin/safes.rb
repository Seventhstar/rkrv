ActiveAdmin.register Safe do
  menu parent: "Структура", label: 'Места хранения'
  permit_params :name, :code1c, :organisation_id, :department_code, :safe_type_id, :actual, :owner_id,
                :from_ids => []
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Сейф/Касса" do
      f.input :name
      f.input :actual, label: 'Актуальный'
      f.input :organisation_id, label: 'Организация', as: :select, collection: Organisation.all
      f.input :safe_type_id, label: 'Тип сейфа/кассы', as: :select, collection: SafeType.all
      f.input :owner_id, label: 'Ответственный', as: :select, collection: User.all
      f.input :code1c, label: 'Код сейфа (для обмена с 1С)'
      f.input :department_code, label: 'Код подразделения (для обмена с 1С)'
      f.input :froms, label: 'Откуда можно перемещать', as: :check_boxes, foreign_key: :from_id, 
                collection: Safe.where(safe_type_id: 1).actual.map{ |s| [s.name, s.id] }
    end
    actions
  end  
end
