ActiveAdmin.register CattleCurrentStatus do

  menu priority: 5, label: proc { I18n.t("admin.cattle.current_status.label") }, parent: 'Cattle'

  permit_params :cattle_id, :title, :calf_gender, :calf_live_status, :date_of_delivery, :quantity, :calf_consumption, :description, :created_by, :updated_by

  index do
    selectable_column
    column "Title" do |t|
      t.title.truncate_words(3)
    end
    column "Cattle" do |cat|
      if cat.cattle_id.present?
        Cattle.find(cat.cattle_id)
      else
        "Nil"
      end
    end
    column :calf_gender
    column :calf_live_status
    column :date_of_delivery
    column :date_of_delivery
    column :quantity
    column :calf_consumption
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
  # filter :cattle_id, as: :select, collection: Cattle.all.collect {|catt| [catt.title, catt.id] }
  filter :calf_gender
  filter :calf_live_status
  filter :date_of_delivery
  filter :quantity
  filter :calf_consumption
  filter :description
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cattle_id, as: :select, collection: Cattle.all.collect {|catt| [catt.title, catt.id] }
      f.input :title
      f.input :calf_gender
      f.input :calf_live_status
      f.input :date_of_delivery
      f.input :quantity
      f.input :calf_consumption
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end


end
