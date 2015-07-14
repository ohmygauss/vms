class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    with_product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    with_product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /products/1
  def update
    with_product do
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /products/1
  def destroy
    with_product do
      @product.destroy
      redirect_to products_path, notice: 'Product was successfully destroyed.'
    end
  end

  private

  def with_product
    @product = Product.find(params[:id])
    yield if block_given?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :id, :document)
  end
end
