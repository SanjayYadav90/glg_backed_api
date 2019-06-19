ActiveAdmin.register Cattle do
  
  menu priority: 4, label: proc { I18n.t("admin.cattle.cattle_list.label") }, parent: 'Cattle'
	
  permit_params :admin_user_id, :cattle_variant_id, :title, :purchase_date, :amount, :tag_no, :parent_cattle_id, :created_by, :updated_by, :description

  index do
    selectable_column
    column :title
    column "Cattle Variant" do |c_var|
      if c_var.cattle_variant_id.present?
        CattleVariant.find(c_var.cattle_variant_id)
      else
        "Nil"
      end
    end
    column :purchase_date
    column :amount
    column :tag_no
    column "Description" do |desc|
      desc.description.truncate_words(5)
    end
    column "Created By" do |creat|
      if creat.created_by.present?
        admin = AdminUser.find(creat.created_by)
        # link_to admin.title, admin_user_path(creat.created_by)
      else
        "Nil"
      end
    end
    column "Updated By" do |up|
      if up.updated_by.present?
        admin = AdminUser.find(up.updated_by)
        # link_to admin.title, admin_user_path(up.updated_by)
      else
        "Nil"
      end
    end
    column :created_at
    column :updated_at
    actions
  end

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
      f.input :admin_user_id, as: :select,:prompt => "Select Vendor", collection: AdminUser.all.collect {|adm_usr| [adm_usr.email, adm_usr.id] }
      f.input :cattle_variant_id, as: :select, :prompt => "Select Variant", collection: CattleVariant.all.collect {|c_var| [c_var.title, c_var.id] }
      f.input :title
      f.input :purchase_date
      f.input :amount
      f.input :tag_no
      f.input :description
      f.input :parent_cattle_id, as: :select, :prompt => "Select parent", collection: Cattle.all.collect {|cat| [ "#{cat.title} : #{cat.tag_no}", cat.id ] }
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
