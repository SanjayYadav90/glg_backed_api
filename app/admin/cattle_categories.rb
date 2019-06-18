ActiveAdmin.register CattleCategory do

  menu priority: 1, label: proc { I18n.t("admin.cattle.category.label") }, parent: 'Cattle'

  permit_params :admin_user_id, :title, :created_by, :updated_by, :description

  index do
    selectable_column
    id_column
    column "Title" do |t|
      t.title.truncate_words(3)
    end
    column "Admin User" do |admin|
      if admin.admin_user_id.present?
        AdminUser.find(admin.admin_user_id)
      else
        "Nil"
      end
    end
    column "Description" do |desc|
      desc.description.truncate_words(5)
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
    actions
  end

  filter :title
  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :created_by
  filter :updated_by
  filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
