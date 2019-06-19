ActiveAdmin.register CreamLevel do

  menu priority: 3, label: proc { I18n.t("admin.products.cream_level.label") }, parent: 'Product'
  permit_params :product_origin_id, :title, :fat_level, :created_by, :updated_by, :description, :status

  index do
    selectable_column
    column :title
    column "Product Origin" do |p_org|
      if p_org.product_origin_id.present?
        ProductOrigin.find(p_org.product_origin_id)
      else
        "Nil"
      end
    end
    column :fat_level
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

  form do |f|
    f.inputs do
      f.input :product_origin_id, as: :select,:prompt => "Select Product Origin", collection: ProductOrigin.all.collect {|prd_org| [prd_org.title, prd_org.id] }
      f.input :title
      f.input :fat_level
      f.input :description
      f.input :status
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
