ActiveAdmin.register ProductVariant do

  menu priority: 3, label: proc { I18n.t("admin.products.variant.label") }, parent: 'Product'
  
  permit_params :product_id, :title, :quantity, :used_by, :batch_no, :created_by, :updated_by, :status

end
