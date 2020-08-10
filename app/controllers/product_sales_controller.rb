class ProductSalesController < Admin::AdminTemplateController
  def index
    @title = t("menu_title.business.product_sale.index")
    @categories = Category.where(created_by: current_user.id)
    @business_types = BusinessType.where(created_by: current_user.id)
    @customers = Customer.where(created_by: current_user.id)
  end

  def checkout
    if params[:customer_id] != "Select a Customer" && params[:date] != ""
      @sale_list = SaleList.new(date: params[:date], customer_id: params[:customer_id], first_payment: params[:first_payment], note: params[:note], created_by: current_user.id)
      if @sale_list.save
        @business_types = ActiveSupport::JSON.decode(params[:cartjson].to_json)
        @business_types["itemList"].each do |business_type|
          @qty = business_type.second["qty"].to_i
          @business_type_id = business_type.second["id"].to_i
          while @qty>0
            SaleListBusinessType.create(sale_list_id: @sale_list.id, business_type_id: @business_type_id, created_by: current_user.id)
            @qty-=1
          end
        end
        render json: { status: true, message: "Checkout Complete!" }
      else
        render json: { status: false, message: "Checkout Fail!" }
      end
    else
      render json: { status: false, message: "Date and Customer is not null!" }
    end
  end
end
