ActiveAdmin.register ProductVariant do

  menu priority: 5, label: proc { I18n.t("admin.products.variant.label") }, parent: 'Product'
  
  permit_params :product_id, :title, :quantity, :used_by, :batch_no, :created_by, :updated_by, :status

  index do
    selectable_column
    column :title
    column "Product" do |prod|
      if prod.product_id.present?
        Product.find(prod.product_id)
      else
        "Nil"
      end
    end
    column :quantity
    column :used_by
    column :batch_no
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
