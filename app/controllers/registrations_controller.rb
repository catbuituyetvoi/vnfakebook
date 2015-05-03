class RegistrationsController < Devise::RegistrationsController
  
 	def create
    super
    if resource.save
        @go = GeneralObject.create(object_type: "user")
        resource.object_id = @go.id
        resource.save
    end
  end

  protected
  def after_sign_up_path_for(resource)
    '/gettingstarted'
  end
 
end