ActiveAdmin.register ProductOrigin do

  menu priority: 2, label: proc { I18n.t("admin.products.origin.label") }, parent: 'Product'
  
  permit_params :category_id, :title, :description, :created_by, :status

end
