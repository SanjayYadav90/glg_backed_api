ActiveAdmin.register ServiceState do

  menu label: proc { I18n.t("admin.service.state.label") }
  permit_params :admin_user_id, :title, :started_at, :remarks, :created_by, :status

  index do
    selectable_column
    id_column
    column :admin_user_id
    column :title
    column :started_at
    column :remarks
    column :created_by
    column :status
    column :created_at
    column :updated_at
    actions
  end

  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :title
  filter :started_at
  filter :remarks
  filter :created_by
  filter :status
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :title
      f.input :started_at
      f.input :remarks
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status
    end
    f.actions
  end

end
