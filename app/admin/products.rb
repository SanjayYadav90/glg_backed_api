ActiveAdmin.register Product do

  menu priority: 4, label: proc { I18n.t("admin.products.product.label") }, parent: 'Product'

  permit_params :cream_level_id, :title, :description, :status, :created_by, :updated_by

  index do
    selectable_column
    column :title
    column "Cream Level" do |cr_lev|
      if cr_lev.cream_level_id.present?
        CreamLevel.find(cr_lev.cream_level_id)
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
    column :status
    column :created_at
    column :updated_at
    actions
  end

  # filter :cream_level_id, as: :select, collection: CreamLevel.all.collect {|cream| [cream.title, cream.id] }
  filter :title
  filter :description
  filter :status
  filter :created_by
  filter :updated_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cream_level_id, as: :select, :prompt => "Select Cream Level", collection: CreamLevel.all.collect {|cream| [cream.title, cream.id] }
      f.input :title
      f.input :description
      f.input :status
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
