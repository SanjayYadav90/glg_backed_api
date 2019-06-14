ActiveAdmin.register Cattle do
  
  menu priority: 4, label: proc { I18n.t("admin.cattle.cattle_list.label") }, parent: 'Cattle'
	
  permit_params :admin_user_id, :cattle_variant_id, :title, :description,  :purchase_date, :amount, :tag_no, :created_by

  # filter :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
  # filter :cattle_variant_id, as: :select, collection: CattleVariant.all.collect {|c_var| [c_var.title, c_var.id] }
  filter :title
  filter :description
  filter :purchase_date
  filter :amount
  filter :tag_no
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :cattle_variant_id, as: :select, collection: CattleVariant.all.collect {|c_var| [c_var.title, c_var.id] }
      f.input :title
      f.input :description
      f.input :purchase_date
      f.input :amount
      f.input :tag_no
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
