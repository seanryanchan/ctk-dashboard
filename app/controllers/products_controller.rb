class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def yearEnd
    if logged_in?
      @products = Product.all
    else
      redirect_to root_url
    end
  end

  def addForm
    if logged_in?
      @product = Product.find(params[:id])
    else
      redirect_to logged_in?
    end
  end

  def add
    @product = Product.find(params[:id])
    @product.quantity = @product.quantity + params[:add_qty].to_i
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def releaseForm
    @product = Product.find(params[:id])
  end

  def release
    @product = Product.find(params[:id])
    newQty = @product.quantity - params[:released_qty].to_i
    if newQty < 0
      @product.quantity = newQty
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def brandQuery
    if(params[:brand_query])
      @products = Product.where('brand LIKE ?', "%#{params[:brand_query]}%")
    else
      @products = Product.all
    end
    render 'index'
  end

  # GET /products
  # GET /products.json
  def index
    if logged_in?
      @products = Product.all
    else
      redirect_to root_url
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    if logged_in?
      @product = Product.new
    else
      redirect_to root_url
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:brand, :product_type, :quantity, :unit_price, :brand_query, :released_qty, :add_qty)
    end
end
