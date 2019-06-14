ActiveAdmin.register CattleBreed do
  
  menu priority: 2, label: proc { I18n.t("admin.cattle.breed.label") }, parent: 'Cattle'

  permit_params :cattle_category_id, :title, :description, :created_by

  filter :title
  # filter :cattle_category_id, as: :select, collection: CattleCategory.all.collect {|c_cat| [c_cat.title, c_cat.id] }
  filter :description
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cattle_category_id, as: :select, collection: CattleCategory.all.collect {|c_cat| [c_cat.title, c_cat.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
