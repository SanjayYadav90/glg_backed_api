ActiveAdmin.register CattleCurrentStatus do

  menu priority: 5, label: proc { I18n.t("admin.cattle.current_status.label") }, parent: 'Cattle'

  permit_params :cattle_id, :title, :calf_gender, :calf_live_status, :date_of_delivery, :quantity, :calf_consumption, :description, :created_by

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
    end
    f.actions
  end


end
