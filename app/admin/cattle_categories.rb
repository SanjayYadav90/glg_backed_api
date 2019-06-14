ActiveAdmin.register CattleCategory do

  menu priority: 1, label: proc { I18n.t("admin.cattle.category.label") }, parent: 'Cattle'

  permit_params :admin_user_id, :title, :description, :created_by

  filter :title
  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :description
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
