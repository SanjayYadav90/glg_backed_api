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

  form do |f|
    f.inputs do
      f.input :category_id , as: :select,:prompt => "Select Category", collection: Category.all.collect {|cat| [cat.title, cat.id] }
      f.input :title
      f.input :description
      f.input :status
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
