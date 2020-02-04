ActiveAdmin.register SafeLink do

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
  f.inputs "Add/Edit Article" do
    f.input :to
    f.input :author
    f.input :description
    f.input :categories, :as => :check_boxes
  end
  actions
end
  
end
