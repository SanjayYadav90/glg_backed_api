ActiveAdmin.register User do

  menu priority: 2, label: proc { I18n.t("admin.users.user.label") }, parent: 'Profiles'

  permit_params :salutaion, :first_name, :last_name, :gender, :email, :mobile, :password, :password_confirmation, :call_verified, :premimum, :status

  index do
    selectable_column
    id_column
    column :salutaion
    column :first_name
    column :last_name
    column :gender
    column :email
    column :mobile
    column :call_verified
    column :premimum
    column :status
    column :created_at
    column :updated_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :gender
  filter :gender, as: :select, collection: -> { GENDER } 
  filter :email
  filter :mobile
  filter :call_verified
  filter :premimum
  filter :status, as: :select, collection: -> { USER_STATUS }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :salutaion, as: :select, :collection => SALUTATION
      f.input :first_name
      f.input :last_name
      f.input :gender, as: :select, :collection => GENDER
      f.input :email
      f.input :mobile
      f.input :password
      f.input :password_confirmation
      f.input :call_verified
      f.input :premimum
      f.input :gender, as: :select, :collection => USER_STATUS
    end
    f.actions
  end
end
