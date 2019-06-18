ActiveAdmin.register ProductOrigin do

  menu priority: 2, label: proc { I18n.t("admin.products.origin.label") }, parent: 'Product'
  
  permit_params :category_id, :title, :created_by, :updated_by, :description, :status

end
