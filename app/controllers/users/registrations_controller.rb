class Users::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
 before_filter :configure_account_update_params, only: [:update]
 before_filter :authenticate_user!, except: [:new, :create]
  
  
  # GET /resource/sign_up
   def new
     super
   end
 
  # POST /resource
    def create
    build_resource(sign_up_params)
    resource.save
    case resource.type
        when "Model" 
          resource.create_model_profile!()
        when "Photographer"
          resource.create_photographer_profile!()
        when "Designer"
          resource.create_designer_profile!()
        end
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
         respond_to do |format|
          format.json { render :json => {}, :status => :ok }
          format.html { respond_with resource, after_sign_up_path_for(resource) }
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_to do |format|
          format.json { render :json => {}, :status => :ok }
          format.html { respond_with resource, after_inactive_sign_up_path_for(resource) } 
        end
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
       respond_to do |format|
        format.json { render :json => resource.errors, :status => :unprocessable_entity }
        format.html { respond_with resource }
        end
    end
  end
  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_to do |format|
          format.json { render :json => {}, :status => :ok }
          format.html { respond_with resource, location: my_profile_path } 
        end
    else
      clean_up_passwords resource
      respond_to do |format|
        format.json { render :json => resource.errors, :status => :unprocessable_entity }
        format.html { respond_with resource}
      end
    end
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

   protected
   
   def update_resource(resource, params)
    if params[:password].blank? 
      resource.update_without_password(params)
    else
      super
    end 
  end
  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) << :email << :type
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) << :name << :surname << :about << :country_code << :city << :avatar << :cover << :password << :sex << :birthday << :password_confirmation << :current_password
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
