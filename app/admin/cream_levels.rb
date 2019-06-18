ActiveAdmin.register CreamLevel do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  menu priority: 5, label: proc { I18n.t("admin.products.cream_level.label") }, parent: 'Product'
  permit_params :product_origin_id, :title, :fat_level, :created_by, :updated_by, :description, :status
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
