class UsrVendorPropertiesController < ApplicationController
  before_action :set_usr_vendor_property, only: [:show, :edit, :update, :destroy]

  # GET /usr_vendor_properties
  # GET /usr_vendor_properties.json
  def index
    if usr_contact_signed_in?
      @current_merchant = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id)
    else
      @current_merchant = FALSE
    end
  end

  # GET /usr_vendor_properties/1
  # GET /usr_vendor_properties/1.json
  def show
    @categories = []
    if usr_contact_signed_in?
      @current_merchant = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id)
    else
      @current_merchant = FALSE
    end

    @vendor = UsrVendorProperty.find(params[:id])
    @items = @vendor.prd_items
    if !@items.empty?
      @items.each do |item|
        type_id = item.prd_type_id
        unless type_id.empty?
          sub_category_id = PrdType.find(type_id).prd_sub_category_id
          category_id  = PrdSubCategory.find( sub_category_id).prd_categories_id
          @categories << PrdCategory.find(category_id).name
        end
      end
    end

  end

  # GET /usr_vendor_properties/new
  def new
    @roles = UsrRole.all
    if current_usr_contact
      @user_contact_edit = UsrContact.find(id = current_usr_contact.id)
      @user_contact_edit.usr_contact_vendors.build
      @user_contact_edit.usr_vendor_properties.build
    else
      @user_contact = UsrContact.new
      @user_contact.usr_contact_vendors.build
      @user_contact.usr_vendor_properties.build
    end

  end

  # GET /usr_vendor_properties/1/edit
  def edit
    @roles = UsrRole.all
    @user_contact_edit = UsrContact.find(id = current_usr_contact.id)
  end

  # POST /usr_vendor_properties
  # POST /usr_vendor_properties.json
  def create
    @usr_vendor_property = UsrVendorProperty.new(usr_vendor_property_params)

    respond_to do |format|
      if @usr_vendor_property.save
        format.html { redirect_to root_path, notice: 'Usr vendor property was successfully created.' }
        format.json { render :show, status: :created, location: @usr_vendor_property }
      else
        format.html { render :new }
        format.json { render json: @usr_vendor_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usr_vendor_properties/1
  # PATCH/PUT /usr_vendor_properties/1.json
  def update
    additional_user = UsrAdditionalUser.all
    @user_contact_edit = UsrContact.find(id = current_usr_contact.id)
    if @user_contact_edit.update(usr_contact_params)

      @emailSet = []
      @emailAdd = params[:usr_contact][:usr_contact_vendors_attributes]["0"][:usr_vendor_property_attributes][:usr_additional_users_attributes]
      #Rails.logger.debug("My object at update: #{@emailAdd.inspect}")

      if @emailAdd != nil
        @emailAdd.each do |key, value|
		if value[:email] != ""
          @emailSet << value[:email]
          additionalUseremail = value[:email]
          additionalUserRole = value[:role]
          UsrMailer.usr_additional_signup(additionalUseremail, additionalUserRole).deliver_now
		end
        end
      end

      # additioanal user save
      additional_user.each do |additioalUser|
        if (additioalUser.email == params[:usr_contact][:email])
          contact_id = UsrContact.find_by_email(params[:usr_contact][:email]).id # get userContat_id by filtering the given email address
          additional_user_roles = additional_user.find_by_email( params[:usr_contact][:email]).role # take additional users all rols as string comma separated
          roles_array = additional_user_roles.split(",") # split and convert into array
          roles_array.each do |val|
            role_id = UsrRole.find_by_role_name(val).id #get role_id by role name
            @usr_contact_role = UsrContactRole.new(:usr_contact_id=>contact_id, :usr_role_id=>role_id) #save contact_id and role_id to the
            @usr_contact_role.save
          end
        end
      end

      redirect_to root_path, notice: 'Usr vendor property was successfully updated.'
    else
      render :new, notice: 'Usr vendor property was not updated successfully.'
    end
  end

  def additional_signup

  end

  # DELETE /usr_vendor_properties/1
  # DELETE /usr_vendor_properties/1.json
  def destroy
    @usr_vendor_property.destroy
    respond_to do |format|
      format.html { redirect_to usr_vendor_properties_url, notice: 'Usr vendor property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_in
    if usr_contact_signed_in?
      vendor_id = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id).usr_vendor_property_id
      redirect_to usr_vendor_property_path(vendor_id)
    end    
  end

  def side_bar
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usr_vendor_property
    @user_contact = UsrContact.find(current_usr_contact )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usr_vendor_property_params
    params.require(:usr_vendor_property).permit(:specified_area, :mobile, :website, :shop_name)
  end

  def usr_contact_params
  params.require(:usr_contact).permit(:first_name, :last_name, :dob, :gender,
                                      :mobile, :image,
                                      usr_contact_vendors_attributes:
                                          [:id, :usr_contacts_id, :usr_vendor_properties_id,
                                           usr_vendor_property_attributes:
                                              [:id, :shop_name, :specified_area, :mobile, :website,
                                               usr_vendor_branches_attributes:
                                                   [:id, :address_line1,:address_line2, :city ,:zip_code,:usr_vendor_property_id ],usr_additional_users_attributes: UsrAdditionalUser.attribute_names.map(&:to_sym).push(:destroy)]] )
  end
end
