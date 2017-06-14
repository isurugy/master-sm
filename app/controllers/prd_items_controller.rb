class PrdItemsController < ApplicationController

  def new
    @categoies = PrdCategory.all

    @item = PrdItem.new
    # 3.times { @item.prd_item_images.build }
    @item.prd_item_images.build
    @item.prd_within_colombo_deliveries.build
    @item.prd_greater_colombo_deliveries.build
    @item.prd_all_island_deliveries.build
    # session variable for selected/unselected types
    session[:selectedtypes] = ''
    session[:unselectedtypes] = ''
    # session variables for selected/unselected
    session[:selectedsubcat] = ''
    session[:unselectedsubcat] = ''

    @vendor_id  = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id).usr_vendor_property_id

  end

  def create
    current_usr = current_usr_contact.id
    user_vendor_property_id = UsrContactVendor.find_by_usr_contact_id(current_usr).usr_vendor_property_id
    @item = PrdItem.new(item_params)
    @item.usr_vendor_property_id = user_vendor_property_id
    if @item.save
      @vendor_id  = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id).usr_vendor_property_id
      redirect_to usr_vendor_property_path(@vendor_id)
    else
      render 'new'
    end
  end

  def index
    @items = PrdItem.all
    if(current_usr_contact!= nil)
      @user_contact = UsrContact.find(current_usr_contact )
    else
      @user_contact = ''
    end
  end

  def show
    @item = PrdItem.find(params[:id])
    @images = @item.prd_item_images
    @within_colombo_deliveries = @item.prd_within_colombo_deliveries
    @greater_colombo_deliveries = @item.prd_greater_colombo_deliveries
    @all_island_deliveries = @item.prd_all_island_deliveries
  end

  def edit
    @item = PrdItem.find(params[:id])
  end

  def update
    @item = PrdItem.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to prd_item_path
    else
      render 'edit'
    end
  end

  def apple
    @subCategoies=[]
    selectedCategory = params[:SelectedCategory]
    prdSubCategories = PrdSubCategory.all
    prdCategories = PrdCategory.all
    prdCategories.each do |prdCategoiry|
      if (prdCategoiry.name == params[:SelectedCategory])
        @categoryId = PrdCategory.find_by_name(params[:SelectedCategory]).id
        end
    end

    prdSubCategories.each do |prdSubCategory|
      if(prdSubCategory.prd_categories_id ==@categoryId)
        @subCategoies << prdSubCategory.name
      end
    end

    respond_to do |format|
      format.html
      format.json {render json: @subCategoies}
    end
  end

  def get_types
    @types = []
    selectedSubCategory = params[:SelectedSubCategory]
    prdSubCategories = PrdSubCategory.all
    prdtypes = PrdType.all
    prdSubCategories.each  do |prdSubCategory|
      if(prdSubCategory.name == params[:SelectedSubCategory])
        @subCategoryId = PrdSubCategory.find_by_name(params[:SelectedSubCategory]).id
      end
    end

    prdtypes.each do |prdtype|
      if(prdtype.prd_sub_category_id ==@subCategoryId)
        value = prdtype.name.to_s+"~"+prdtype.id.to_s
        @types <<value
      end
    end

    respond_to do |format|
      format.html
      format.json {render json: @types}
    end
  end

  def get_type_id
    types = PrdType.all
    types.each do |type|
      if(type.name == params[:SelectedType])
        @typeId = PrdType.find_by_name(params[:SelectedType]).id
      end
    end

    respond_to do |format|
      format.html
      format.json {render json: @typeId}
    end
  end

  def get_subcat_id
    selectedSubCat = params[:selectedSubcategory]
    allSubCategories = PrdSubCategory.all
    allSubCategories.each do |subcat|
      if(subcat.name == selectedSubCat)
        @subCatId = subcat.id
        break
      end
    end

    respond_to do |format|
      format.html
      format.json {render json: @subCatId}
    end
  end

  def add_to_cart
    itemId = params[:ItemId]
    currentuser = current_usr_contact.id

    @uersOder = PrdOrder.new
    @uersOder.customer_id = currentuser
    @uersOder.item_id = itemId
    @uersOder.save

    respond_to do |format|
      format.html
      format.json {render json: currentuser}
    end
  end

  def get_category_name
    @category = []
    sub_cat = params[:selectedSubcat].to_s
    category_id = PrdSubCategory.find_by_name(sub_cat).prd_categories_id
    @category << PrdCategory.find(category_id).name.to_s
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def get_cart_count
    @cartCount = []
    currentuser_id = current_usr_contact.id
    userorder = PrdOrder.all

    userorder.each do |order|
      if(order.customer_id == currentuser_id)
        @cartCount << order.item_id
      end
    end

    respond_to do |format|
      format.html
      format.json {render json: @cartCount}
    end
  end

  def get_type_breadcrumb
    typename =  params[:SeachedType]
    types = PrdType.all

    @wantedTypes = []
     @selectedTypes = PrdType.where("name LIKE ?" , "%#{typename}%")
    @selectedTypes.each do |type|
       # @wantedTypes << type.prd_sub_category_id
       # subcategory_id = type.find()
       type_name =type.name
       type_id = type.id
       subcategory_name = PrdSubCategory.find(type.prd_sub_category_id).name
       category_id = PrdSubCategory.find(type.prd_sub_category_id).prd_categories_id
       category_name = PrdCategory.find(category_id).name
       @wantedTypes <<category_name.to_s+"~"+subcategory_name.to_s+"~"+type_name+"~"+type_id.to_s
     end

    respond_to do |format|
      format.html
      format.json {render json: @wantedTypes}
    end
  end

  def set_selected_types
    prd_type_variation_item = PrdTypeVariation.select('prd_type_id','prd_variation_item_id').distinct
    @type_fields = []
    @variations = []
    @result = []
    selected_type = params[:selectedType]
    if session[:selectedtypes] == ''
      session[:selectedtypes] = selected_type
    else
      types = session[:selectedtypes].split(",")
      if types.length == 1 && types[0] != selected_type
        session[:selectedtypes] = session[:selectedtypes] + ',' + selected_type
      elsif types.length == 1 && types[0] == selected_type
        session[:selectedtypes] = ''
      elsif types.length == 2 && types[0] == selected_type
        session[:selectedtypes] = types[1]
      elsif types.length == 2 && types[1] == selected_type
        session[:selectedtypes] = types[0]
      end
    end
    types = session[:selectedtypes].split(",")
    if types.length == 0
      @type_fields << 'no-type-selected'
      respond_to do |format|
        format.html
        format.json { render json: {result: @type_fields,variation:@variations} }
      end
    else
      types.each do |type_id|
        variation_item = prd_type_variation_item.where(prd_type_id:type_id).select('prd_variation_item_id')
        variation_item.each do |v_item|
          fields = PrdVariationItem.find(v_item.prd_variation_item_id)
          @type_fields << fields.name.to_s
        end
      end

      @type_fields.uniq.each do |v_item|
        if types.length == 2
          type_variation = PrdTypeVariation.where(prd_variation_item_id:v_item,prd_type_id:[types[0], types[1]])
        else
          type_variation = PrdTypeVariation.where(prd_variation_item_id:v_item,prd_type_id:types[0])
        end

        type_variation.each do |t_variation|
          @variations <<  PrdVariation.find(t_variation.prd_variation_id).name.to_s
        end
      end

      @result << @variations
      @result << @type_fields.uniq
      respond_to do |format|
        format.html
        format.json { render json: @result  }
      end
    end

  end




  def get_variation_list
    @types = []

    selected_spec = params[:SelectedSpec]
    unselected_type = params[:UnSelectedType]
    types_with_commas = session[:selectedtypes]

    prd_variation_item = PrdVariationItem.find_by_name(selected_spec).id
    type_sets = types_with_commas.split(",")
    prd_types_1 = type_sets[0]

    if type_sets[1]
      prd_types_2 = type_sets[1]
      prd_type_variation = PrdTypeVariation.where(prd_variation_item_id:prd_variation_item, prd_type_id:[prd_types_1, prd_types_2])
    else
      prd_type_variation = PrdTypeVariation.where(prd_variation_item_id:prd_variation_item, prd_type_id:prd_types_1)
    end

    @uniq_prd_type_variation = prd_type_variation.pluck(:prd_variation_id).uniq

    @uniq_prd_type_variation.each do |variation|
      # id  = variation
      # value = PrdVariation.find(variation).value
      # test = "{id: "+id.to_s+" ,value: \""+value.to_s+"\"}"
      # @types << test
      # @types << PrdVariation.where(id:variation).select('id','value')
    end
    @types = PrdVariation.where(id:[6,7]).select('id','value')
    # Rails.logger.debug("Myzzzz: #{@types.inspect}")
    respond_to do |format|
      format.html
      format.json { render json: @types }
    end
  end


  private
  def item_params
    params.require(:prd_item).permit(:item_name, :brand, :item_no, :short_description, :long_description, :prd_type_id, :usr_vendor_property_id, :price,:base_price, :price_discount, :percentage_discount, :stock_count, :availability, :remove_image,
                                     prd_item_images_attributes: [:id, :image, :description, :_destroy ],
                                     prd_home_baths_attributes: [:id, :color, :material, :_destroy ],
                                     prd_home_beddings_attributes: [:id, :size, :color, :material, :_destroy ],
                                     prd_home_furnitures_attributes: [:id, :room, :color, :material, :_destroy ],
                                     prd_home_gardens_attributes: [:id, :_destroy ],
                                     prd_within_colombo_deliveries_attributes: [:id, :prd_item_id, :delivery_rate, :delivery_period, :_destroy],
                                     prd_greater_colombo_deliveries_attributes: [:id, :prd_item_id, :delivery_rate, :delivery_period, :_destroy],
                                     prd_all_island_deliveries_attributes: [:id, :prd_item_id, :delivery_rate, :delivery_period, :_destroy])


  end
end


# test smart mall
# test change branch 05