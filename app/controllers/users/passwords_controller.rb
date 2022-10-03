class Users::PasswordsController < Devise::PasswordsController
  prepend_before_action :require_no_authentication, :only => [:edit, :update]

  def update
    super
    if resource.errors.empty?
      sign_out(resource_name)
      sign_in(resource_name, resource)
    end
  end
end
