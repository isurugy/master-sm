class UsrBuyerPaymentMethodsController < ApplicationController
  before_action :set_usr_buyer_payment_method, only: [:show, :edit, :update, :destroy]

  # GET /usr_buyer_payment_methods
  # GET /usr_buyer_payment_methods.json
  def index
    @usr_buyer_payment_methods = UsrBuyerPaymentMethod.all
  end

  # GET /usr_buyer_payment_methods/1
  # GET /usr_buyer_payment_methods/1.json
  def show
  end

  # GET /usr_buyer_payment_methods/new
  def new
    @usr_buyer_payment_method = UsrBuyerPaymentMethod.new
  end

  # GET /usr_buyer_payment_methods/1/edit
  def edit
  end

  # POST /usr_buyer_payment_methods
  # POST /usr_buyer_payment_methods.json
  def create
    @usr_buyer_payment_method = UsrBuyerPaymentMethod.new(usr_buyer_payment_method_params)

    respond_to do |format|
      if @usr_buyer_payment_method.save
        format.html { redirect_to @usr_buyer_payment_method, notice: 'Usr buyer payment method was successfully created.' }
        format.json { render :show, status: :created, location: @usr_buyer_payment_method }
      else
        format.html { render :new }
        format.json { render json: @usr_buyer_payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usr_buyer_payment_methods/1
  # PATCH/PUT /usr_buyer_payment_methods/1.json
  def update
    respond_to do |format|
      if @usr_buyer_payment_method.update(usr_buyer_payment_method_params)
        format.html { redirect_to @usr_buyer_payment_method, notice: 'Usr buyer payment method was successfully updated.' }
        format.json { render :show, status: :ok, location: @usr_buyer_payment_method }
      else
        format.html { render :edit }
        format.json { render json: @usr_buyer_payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usr_buyer_payment_methods/1
  # DELETE /usr_buyer_payment_methods/1.json
  def destroy
    @usr_buyer_payment_method.destroy
    respond_to do |format|
      format.html { redirect_to usr_buyer_payment_methods_url, notice: 'Usr buyer payment method was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usr_buyer_payment_method
      @usr_buyer_payment_method = UsrBuyerPaymentMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usr_buyer_payment_method_params
      params.require(:usr_buyer_payment_method).permit(:card_name, :card_number, :cvv, :expiry_date)
    end
end
