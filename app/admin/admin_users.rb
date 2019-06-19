ActiveAdmin.register AdminUser do

  menu priority: 1, label: proc { I18n.t("admin.users.admin_user.label") }, parent: 'Profiles'
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :title
    column :email
    column "Service State" do |s_state|
      if s_state.service_state_id.present?
        ServiceState.find(s_state.service_state_id)
      else
        "Nil"
      end
    end
    column :role
    column :current_sign_in_ip
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
