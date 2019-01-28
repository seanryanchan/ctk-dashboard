class PurchaseEntriesController < ApplicationController
  before_action :set_purchase_entry, only: [:show, :edit, :update, :destroy]

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
      params.require(:purchase_entry).permit(:product_name, :product_qty, :status)
    end
end
