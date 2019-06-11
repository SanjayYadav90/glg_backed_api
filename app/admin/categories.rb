ActiveAdmin.register Category do

  menu priority: 1, label: proc { I18n.t("admin.products.category.label") }, parent: 'Product'
  
  permit_params :title, :description, :admin_user_id, :created_by, :status

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_by
    column :admin_user_id
    column :status
    column :created_at
    actions
  end

  filter :title
  filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :created_by
  filter :status
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status
    end
    f.actions
  end

end
