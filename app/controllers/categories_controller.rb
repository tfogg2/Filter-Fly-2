class CategoriesController < ApplicationController
  #ApplicationController
  before_action :set_collection
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  # GET /categories
  # GET /categories.json

  def index
    Rails.logger.debug("collection_id: @collection.id")
    @categories = @collection.categories.all

    # if !@collection
    #   @categories = []
    # else
    #   @categories = @collection.categories.all
    #
    #   #Category.where(shopify_collection_id: session[:shopify_collection_id])
    # end

    @collections = Collection.all


    # Trying Nav
    #@custom_collections = ShopifyAPI::CustomCollection.find(:all, params: { limit: 10 },shopify_collection_id: session[:shopify_collection_id])
    #@smart_collections = ShopifyAPI::SmartCollection.find(:all, params: { limit: 10 }, shopify_collection_id: session[:shopify_collection_id])

  end


  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    # @category = @collection.category.new(@collection)
    @category = @collection.categories.new()
    # @category = Category.new(shopify_collection_id: session[:shopify_collection_id])
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json


  def create
    @category = @collection.categories.new(category_params)

    if @category.save
      ActionCable.server.broadcast 'categories',
        title: @category.title,
        collection_id: @category.collection_id
      head :ok
    else

    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = @collection.category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private



    # def set_collection
    #   @shop = ShopifyAPI::Shop.current

    #   @collection = ShopifyCollection.find(params[:shopify_collection_id])

    #   # @collection = .find(params[:shopify_collection_id] || params[:id])

    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id] || params[:id])
      # @category = @collection.category.find(params[:category_id] || params[:id])
      #Category.find(params[:category_id] || params[:id])
    end

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :handle, :shopify_collection_id, :collection_id)
    end
end
