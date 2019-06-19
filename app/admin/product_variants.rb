ActiveAdmin.register ProductVariant do

  menu priority: 5, label: proc { I18n.t("admin.products.variant.label") }, parent: 'Product'
  
  permit_params :product_id, :title, :quantity, :used_by, :batch_no, :created_by, :updated_by, :description, :status

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

  form do |f|
    f.inputs do
      f.input :product_id , as: :select,:prompt => "Select Product", collection: Product.all.collect {|pro| [pro.title, pro.id] }
      f.input :title
      f.input :quantity
      f.input :used_by
      f.input :batch_no
      f.input :description
      f.input :status
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
