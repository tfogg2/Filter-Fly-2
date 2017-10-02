class ProductsController < ShopifyApp::AuthenticatedController
  layout "application"

  before_action :set_collection
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:update, :select_change]
  before_action :set_product_types, only: [:update, :select_change]
  before_action :set_tags, only: [:update, :select_change]


 def index
    Rails.logger.debug("set_shopify_product_id: #{session[:shopify_collection_id]}")

    if !@collection
      @products = []
    else
      @shopify_products = ShopifyAPI::Product.find(:all, params: { limit: 10, collection_id: @collection.id })

      #creating product for each shopify product
      @shopify_products.each do |shopify_product|
        @product = Product.find_or_create_by(shopify_product_id: shopify_product.id )
        @products = Product.all
         #Rails.logger.debug("product: #{product.errors.inspect}")
      end
    end


      # Rails.logger.debug("@shopify_products: #{@shopify_products.inspect}")
      # Rails.logger.debug("---")
      # Rails.logger.debug("@products: #{@products.inspect}")
      # Get the available categories
    if !@collection
      @categories = []
    else
      @categories = @collection.categories.all
      #Category.where(shopify_collection_id: session[:shopify_collection_id])
    end

    if !@collection
      @product_types = []
    else
      @product_types = @collection.category.product_types.all
      #ProductType.where(category_id: @categories.ids)
    end

    if !@collection
      @tags = []
    else
      @tags = @collection.category.product_type.tags.all
      #Tag.where(product_type_id: @product_types.ids)
    end

    #@product_types = @category.product_types.all

    @product = Product.new(shopify_product_id: @collection.id)

 end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new

    @product = Product.new(shopify_product_id: @collection.id)

      #session[:shopify_collection_id])
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
    if @product.update(product_params)
      Rails.logger.debug("Updated Product: #{@product.inspect}")
    else
      Rails.logger.debug("Failed to update product... fml: #{@product.inspect}")
    end
  end

  def select_change
    @product = Product.find_by_id(params[:product_id])
    @category = Category.find_by_id(params[:category_id])

    @shopify_products = ShopifyAPI::Product.find(:all, params: { limit: 10, collection_id:@collection.id })



    if !params[:product_type_id].blank?
      @product_type = @collection.category.product_types.find_by_id(params[:product_type_id])
      @tags = @product_type.tags if @product_type
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
    def set_collection
      @collection = @shop.collections.find(params[:collection_id] || params[:id])
    end

    def set_categories
      if !@collection
        @categories = []
      else
        @categories = @collection.category.find(params[:category_id] || params[:id])
      end
    end
    def set_product_types
      if !@collection
        @product_types = []
      else
        @product_types = @collection.category.product_types.find(params[:product_type_id] || params[:id])
      end
    end
    def set_tags
      if !@collection
        @tags = []
      else
        @tags = @collection.category.product_type.tags.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #    -> Took out
    def product_params
      params.require(:product).permit(:title, :handle, :shopify_collection_id, :category_id, :product_type_id, :shopify_product_id, :tags )
    end
end
