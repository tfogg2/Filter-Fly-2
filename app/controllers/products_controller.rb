class ProductsController < ShopifyApp::AuthenticatedController
  layout "application"
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]

 def index
    Rails.logger.debug("set_shopify_product_id: #{session[:shopify_collection_id]}")

    if session[:shopify_collection_id].blank? 
      @products = []
    else
      @products = ShopifyAPI::Product.find(:all, params: { limit: 10, collection_id:session[:shopify_collection_id] })
      
    end
    @product = Product.new(shopify_product_id: session[:shopify_collection_id])

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end 

  # GET /products/new
  def new
    @product = Product.new(shopify_product_id: session[:shopify_collection_id])
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
        format.html { redirect_to products_path(@product), notice: 'Navigation successfully added.' }
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
        format.html { redirect_to @product, notice: 'product was successfully updated.' }
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
      format.html { redirect_to products_url, notice: 'product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :handle, :shopify_collection_id, :category_id, :product_type_id, :shopify_product_id, :tags =>[] )
    end
end