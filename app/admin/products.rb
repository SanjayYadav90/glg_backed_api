ActiveAdmin.register Product do

  menu priority: 4, label: proc { I18n.t("admin.products.product.label") }, parent: 'Product'

  permit_params :cream_level_id, :title, :description, :status, :created_by, :updated_by

  index do
    selectable_column
    id_column
    column :cream_level_id
    column :title
    column :price
    column :description
    column :status
    column :created_by
    column :created_at
    column :updated_at
    actions
  end

  # filter :cream_level_id, as: :select, collection: CreamLevel.all.collect {|cream| [cream.title, cream.id] }
  filter :title
  filter :price
  filter :description
  filter :status
  filter :created_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :cream_level_id, as: :select, collection: CreamLevel.all.collect {|cream| [cream.title, cream.id] }
      f.input :title
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status
    end
    f.actions
  end

end
