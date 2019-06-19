ActiveAdmin.register Category do

  menu priority: 1, label: proc { I18n.t("admin.products.category.label") }, parent: 'Product'
  
  permit_params :title, :description, :admin_user_id, :created_by, :updated_by, :status

  index do
    selectable_column
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
    # column "Status" do |sat|
    #   if sat.status == true
    #     I18n.t("status.active")
    #   else
    #     I18n.t("status.inactive")
    #   end
    # end
    column :status
    column :created_at
    actions
  end

  filter :title
  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  filter :created_by
  filter :updated_by
  filter :status
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, :prompt => "Select Vendor", collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status
    end
    f.actions
  end

end
