ActiveAdmin.register ServiceState do

  menu label: proc { I18n.t("admin.service.state.label") }
  permit_params :admin_user_id, :title, :started_at, :created_by, :updated_by, :remarks,  :status

  index do
    selectable_column
    column :title
    column "User" do |adm_usr|
      if adm_usr.admin_user_id.present?
        AdminUser.find(adm_usr.admin_user_id)
      else
        "Nil"
      end
    end
    column :started_at
    column "Remarks" do |desc|
      desc.remarks.truncate_words(5)
    end
    column "Created By" do |creat|
      if creat.created_by.present?
        admin = AdminUser.find(creat.created_by)
      else
        "Nil"
      end
    end
    column "Updated By" do |up|
      if up.updated_by.present?
        admin = AdminUser.find(up.updated_by)
        link_to admin.title, admin_user_path(up.updated_by)
      else
        "Nil"
      end
    end
    column :status
    column :created_at
    column :updated_at
    actions
  end

  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :title
  filter :started_at
  filter :created_by
  filter :updated_by
  filter :remarks
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
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status
    end
    f.actions
  end

end
