ActiveAdmin.register CattleBreed do
  
  menu priority: 2, label: proc { I18n.t("admin.cattle.breed.label") }, parent: 'Cattle'

  permit_params :cattle_category_id, :title, :description, :created_by

  index do
    selectable_column
    column "Title" do |t|
      t.title.truncate_words(3)
    end
    column "Category" do |cat|
      if cat.cattle_category_id.present?
        CattleCategory.find(cat.cattle_category_id)
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
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  # filter :cattle_category_id, as: :select, collection: CattleCategory.all.collect {|c_cat| [c_cat.title, c_cat.id] }
  filter :description
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cattle_category_id, as: :select, collection: CattleCategory.all.collect {|c_cat| [c_cat.title, c_cat.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
