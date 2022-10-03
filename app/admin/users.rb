ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :user_name, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :user_name, :role, :reset_password_token, :reset_password_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :email
    column :password
    column :password_confirmation
    column :user_name
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :user_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.submit
  end
end
