ActiveAdmin.register CattleVariant do
  
  menu priority: 3, label: proc { I18n.t("admin.cattle.variant.label") }, parent: 'Cattle'

  permit_params :cattle_breed_id, :title, :description, :created_by

  filter :title
  filter :cattle_breed_id, as: :select, collection: CattleBreed.all.collect {|c_breed| [c_breed.title, c_breed.id] }
  filter :description
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cattle_breed_id, as: :select, collection: CattleBreed.all.collect {|c_breed| [c_breed.title, c_breed.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
