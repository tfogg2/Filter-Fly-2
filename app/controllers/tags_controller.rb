class TagsController < ApplicationController
  before_action :set_collection
  before_action :set_category
  before_action :set_product_type
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = @collection.category.product_type.tags.all
    @product_types = @collection.category.product_types.all
    @categories = @collection.categories.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tags = @collection.category.product_type.tags.all
    @product_types = @collection.category.product_types.all
    @categories = @collection.categories.all
  end

  # GET /tags/new
  def new
    @tag = @collection.category.product_type.tags.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = @collection.category.product_type.tags.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to category_product_type_tags_path(@category, @product_type), notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to category_product_type_tags_path(@category, @product_type), notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to category_product_type_tags_path(@category, @product_type), notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = @shop.collections.find(params[:collection_id] || params[:id])
    end
    def set_category
      @category = @collection.category.find(params[:category_id] || params[:id])
    end

    def set_product_type
      @product_type = @collection.category.product_types.find(params[:product_type_id] || params[:id])
    end

    def set_tag
      @tag = @collection.category.product_type.tags.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:product_type_id, :title, :handle)
    end
end
