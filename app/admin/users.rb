ActiveAdmin.register User do

  menu priority: 2, label: proc { I18n.t("admin.users.user.label") }, parent: 'Profiles'

  permit_params :admin_user_id, :service_state_id, :salutation, :first_name, :last_name, :gender, :email, :mobile, :password, :password_confirmation, :call_verified, :premimum, :status, :created_by, :updated_by

  index do
    selectable_column
    id_column
    column :salutation
    column :first_name
    column :last_name
    column :gender
    column :email
    column :mobile
    column :call_verified
    column :premimum
    column :status
    actions
  end

  filter :first_name
  filter :last_name
  filter :gender, as: :select, collection: -> { GENDER } 
  filter :email
  filter :mobile
  filter :call_verified
  filter :premimum
  filter :status, as: :select, collection: -> { USER_STATUS }
  filter :created_by
  filter :updated_by
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :service_state_id, as: :select, collection: ServiceState.all.collect {|ser_state| [ser_state.title, ser_state.id] }
      f.input :salutation, as: :select, :collection => SALUTATION
      f.input :first_name
      f.input :last_name
      f.input :gender, as: :select, :collection => GENDER
      f.input :email
      f.input :mobile
      f.input :password
      f.input :password_confirmation
      f.input :call_verified
      f.input :premimum
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :status, as: :select, :collection => USER_STATUS
    end
    f.actions
  end
end
