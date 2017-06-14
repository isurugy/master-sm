class UsrBuyerPropertiesController < ApplicationController
  before_action :set_usr_buyer_property, only: [:show, :edit, :update, :destroy]

  # GET /usr_buyer_properties
  # GET /usr_buyer_properties.json
  def index
    @usr_buyer_properties = UsrBuyerProperty.all
  end

  # GET /usr_buyer_properties/1
  # GET /usr_buyer_properties/1.json
  def show
  end

  # GET /usr_buyer_properties/new
  def new
    if current_usr_contact
      @name = current_usr_contact.email.split("@")
      @user_contact = UsrContact.find(id = current_usr_contact.id)
      @user_contact.usr_buyer_billing_addresses.build
      @user_contact.usr_buyer_delivery_addresses.build
      @user_contact.usr_buyer_payment_methods.build
    else
      redirect_to root_path , notice: 'You should be logged in first'
    end

  end

  # GET /usr_buyer_properties/1/edit
  def edit
    @name = current_usr_contact.email.split("@")
    @image = UsrContact.find(current_usr_contact.id).image
  end

  # POST /usr_buyer_properties
  # POST /usr_buyer_properties.json
  def create
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    if @user_contact.update(usr_contact_params)
      redirect_to root_path, notice: 'Usr buyer property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /usr_buyer_properties/1
  # PATCH/PUT /usr_buyer_properties/1.json
  def update
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    if @user_contact.update(usr_contact_params)
      redirect_to root_path, notice: 'Usr buyer property was successfully created.'
    else
      render :new
    end
  end

  # DELETE /usr_buyer_properties/1
  # DELETE /usr_buyer_properties/1.json
  def destroy
    @usr_buyer_property.destroy
    respond_to do |format|
      format.html { redirect_to usr_buyer_properties_url, notice: 'Usr buyer property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def usr_contact_params
    params.require(:usr_contact).permit(:dob, :gender, :first_name, :last_name, :mobile, :image,
    usr_buyer_billing_addresses_attributes: [:id,:address_line1,:address_line2,:city, :zip_code, :country],
    usr_buyer_delivery_addresses_attributes: [:id,:address_line1,:address_line2,:city, :zip_code, :country],
    usr_buyer_payment_methods_attributes: [:card_name, :card_number, :cvv, :expiry_date])
  end

  # Use callbacks to share common setup or constraints between actions.

  def set_usr_buyer_property
    @user_contact = UsrContact.find(id = current_usr_contact.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usr_buyer_property_params
    params.require(:usr_buyer_property).permit(:anniversary, :usr_contact_id)
  end
end
