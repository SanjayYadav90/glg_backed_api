ActiveAdmin.register CattleVariant do
  
  menu priority: 3, label: proc { I18n.t("admin.cattle.variant.label") }, parent: 'Cattle'

  permit_params :cattle_breed_id, :title, :created_by, :updated_by, :description

  index do
    selectable_column
    column :title
    column "Breed" do |bre|
      if bre.cattle_breed_id.present?
        CattleBreed.find(bre.cattle_breed_id)
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
  # filter :cattle_breed_id, as: :select, collection: CattleBreed.all.collect {|c_breed| [c_breed.title, c_breed.id] }
  filter :created_by
  filter :updated_by
  filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cattle_breed_id, as: :select, :prompt => "Select Cattle Breed", collection: CattleBreed.all.collect {|c_breed| [c_breed.title, c_breed.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
