class PurchaseEntriesController < ApplicationController
  before_action :set_purchase_entry, only: [:show, :edit, :update, :destroy]

  def releaseBacklog
    @purchase_entry = PurchaseEntry.find_by(product_id: params[:id])
    newQty =@purchase_entry.product.quantity - @purchase_entry.product_qty
    if newQty > 0
      @purchase_entry.product.quantity = newQty
      @purchase_entry.product.save
      @purchase_entry.delete
    else
      flash["danger"] = "You currently do not have enough quantity of the product."
    end
    redirect_to backlogs_path
  end

  def newEntryToOrder
    #
  end
  def createEntryToOrder
    #
  end

  # status legend
  # 0 - unconfirmed
  # 1 - confirmed
  # 2 - backlogged

  def backlogForm
    @product = Product.find(params[:id])
    @purchase_entry = PurchaseEntry.new()
    @purchase_orders = PurchaseOrder.all
  end

  def backlog
    @product = Product.find(params[:id])
    @purchase_entry = PurchaseEntry.new(purchase_entry_params)
    @purchase_entry.status = PurchaseEntriesHelper::BACKLOGGED
    @purchase_entry.product_id = @product.id
    respond_to do |format|
      if @purchase_entry.save
        format.html { redirect_to @purchase_entry, notice: 'Purchase entry was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def createEntryForm
    @product = Product.find(params[:id])
    @purchase_orders = PurchaseOrder.all
    @purchase_entry = PurchaseEntry.new()
  end

  def createEntry
    @product = Product.find(params[:id])
    @purchase_entry = PurchaseEntry.new(purchase_entry_params)
    @purchase_entry.product_id = @product.id
    case @purchase_entry.status
    when "Unconfirmed"
      @purchase_entry.status = PurchaseEntriesHelper::UNCONFIRMED
    when "Confirmed"
      @purchase_entry.status = PurchaseEntriesHelper::CONFIRMED
    when "Backlogged"
      @purchase_entry.status = PurchaseEntriesHelper::BACKLOGGED
    end
    @products = Product.all
    respond_to do |format|
      if @purchase_entry.save
        format.html { redirect_to @purchase_entry, notice: 'Purchase entry was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def showBacklogs
    @purchase_entries = PurchaseEntry.where(status: PurchaseEntriesHelper::BACKLOGGED)
    render "backlogs"
  end
  # GET /purchase_entries
  # GET /purchase_entries.json
  def index
    @purchase_entries = PurchaseEntry.all
  end

  # GET /purchase_entries/1
  # GET /purchase_entries/1.json
  def show
  end

  # GET /purchase_entries/new
  def new
    @purchase_entry = PurchaseEntry.new
    @products = Product.all
  end

  # GET /purchase_entries/1/edit
  def edit
  end

  # POST /purchase_entries
  # POST /purchase_entries.json
  def create
    @purchase_entry = PurchaseEntry.new(purchase_entry_params)

    respond_to do |format|
      if @purchase_entry.save
        format.html { redirect_to @purchase_entry, notice: 'Purchase entry was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_entries/1
  # PATCH/PUT /purchase_entries/1.json
  def update
    respond_to do |format|
      if @purchase_entry.update(purchase_entry_params)
        format.html { redirect_to @purchase_entry, notice: 'Purchase entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_entries/1
  # DELETE /purchase_entries/1.json
  def destroy
    @purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to purchase_entries_url, notice: 'Purchase entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_entry
      @purchase_entry = PurchaseEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_entry_params
      params.require(:purchase_entry).permit(:product_name, :product_qty, :status, :product_id, :purchase_order_id, :brand)
    end
end
