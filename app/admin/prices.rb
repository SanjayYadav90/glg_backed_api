ActiveAdmin.register Price do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :product_id, :service_state_id, :title, :price, :description, :created_by, :updated_by, :status

  index do
    selectable_column
    column :title
    column "Product" do |prod|
      if prod.product_id.present?
        Product.find(prod.product_id)
      else
        "Nil"
      end
    end
    column "Service State" do |serv|
      if serv.service_state_id.present?
        ServiceState.find(serv.service_state_id)
      else
        "Nil"
      end
    end
    column :price
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

  form do |f|
    f.inputs do
      f.input :product_id , as: :select,:prompt => "Select Product", collection: Product.all.collect {|pro| [pro.title, pro.id] }
      f.input :service_state_id, as: :select,:prompt => "Select Service State", collection: ServiceState.all.collect {|s_state| [s_state.title, s_state.id] }
      f.input :title
      f.input :price
      f.input :description
      f.input :status
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
