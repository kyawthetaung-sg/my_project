class PaymentModesController < Admin::AdminTemplateController
  before_action :set_payment_mode, only: [:show, :edit, :update, :destroy]

  # GET /payment_modes
  # GET /payment_modes.json
  def index
    @title = 'Payment Modes'
    @payment_modes = PaymentMode.where(created_by: current_user.id).or(PaymentMode.where(created_by: nil))
  end

  # GET /payment_modes/1
  # GET /payment_modes/1.json
  def show
    @title = 'Payment Modes'
  end

  # GET /payment_modes/new
  def new
    @title = 'Payment Modes'
    @payment_mode = PaymentMode.new
  end

  # GET /payment_modes/1/edit
  def edit
    @title = 'Payment Modes'
  end

  # POST /payment_modes
  # POST /payment_modes.json
  def create
    @title = 'Payment Modes'
    @payment_mode = PaymentMode.new(payment_mode_params)
    @payment_mode.created_by = current_user.id

    respond_to do |format|
      if @payment_mode.save
        format.html { redirect_to payment_modes_path, notice: 'Payment mode was successfully created.' }
        format.json { render :show, status: :created, location: @payment_mode }
      else
        format.html { render :new }
        format.json { render json: @payment_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_modes/1
  # PATCH/PUT /payment_modes/1.json
  def update
    @title = 'Payment Modes'
    @payment_mode.created_by = current_user.id
    respond_to do |format|
      if @payment_mode.update(payment_mode_params)
        format.html { redirect_to payment_modes_path, notice: 'Payment mode was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_mode }
      else
        format.html { render :edit }
        format.json { render json: @payment_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_modes/1
  # DELETE /payment_modes/1.json
  def destroy
    @payment_mode.destroy
    respond_to do |format|
      format.html { redirect_to payment_modes_url, notice: 'Payment mode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_mode
      @payment_mode = PaymentMode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_mode_params
      params.require(:payment_mode).permit(:name)
    end
end
