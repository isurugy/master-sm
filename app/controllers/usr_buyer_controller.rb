class UsrBuyerController < ApplicationController
  def index
    @currentuser = current_usr_contact
    @buyer_details = UsrBuyer.find(id= @currentuserid)
  end

  def new
    @name = current_usr_contact.email.split("@")
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    @user_contact.usr_buyer_billing_addresses.build
    @user_contact.usr_buyer_delivery_addresses.build
    @user_contact.usr_buyer_payment_methods.build
  end

  def create
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    if @user_contact.update(usr_contact_params)
      redirect_to root_path, notice: 'Todo list was successfully updated.'
    else
      render :new
    end
  end

  def edit
    @name = current_usr_contact.email.split("@")
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    @user_contact.usr_buyer_billing_addresses.build
    @user_contact.usr_buyer_delivery_addresses.build
    @user_contact.usr_buyer_payment_methods.build

  end

  def update
    @user_contact = UsrContact.find(id = current_usr_contact.id)
    if @user_contact.update(usr_contact_params)
      redirect_to root_path, notice: 'Your details were successfully updated.'
    else
      render :new
    end


  end

  def destroy

  end

  private
  def usr_contact_params
    params.require(:usr_contact).permit(:dob, :gender, :first_name, :last_name, :mobile, :image,
                                        usr_buyer_billing_addresses_attributes:
                                            [:address_line1,:address_line2,:city, :zip_code, :country],
                                        usr_buyer_delivery_addresses_attributes:
                                            [:address_line1,:address_line2,:city, :zip_code, :country],
                                        usr_buyer_payment_methods_attributes:
                                            [:card_name, :card_number, :cvv, :expiry_date])
  end

  def set_usr_buyer_property
    @user_contact = UsrContact.find(current_usr_contact )
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_usr_buyer_payment_method
    @usr_buyer_payment_method = UsrBuyerPaymentMethod.find(params[:id])
  end

end
