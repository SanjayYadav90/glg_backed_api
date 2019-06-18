ActiveAdmin.register ProductOrigin do

  menu priority: 2, label: proc { I18n.t("admin.products.origin.label") }, parent: 'Product'
  
  permit_params :category_id, :title, :created_by, :updated_by, :description, :status

  index do
    selectable_column
    column :title
    column "Category" do |cat|
      if cat.category_id.present?
        Category.find(cat.category_id)
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

end
