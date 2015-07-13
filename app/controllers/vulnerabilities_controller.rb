class VulnerabilitiesController < ApplicationController
  def new 
    with_product do
  	 @vulnerability = Vulnerability.new
    end
  end

  def resolve
    with_product do
      @vulnerability = Vulnerability.find(params[:id])
      @vulnerability.resolve!
    
      redirect_to product_path(@product), notice: 'Vulnerability was successfully resolved'
    end
  end

  def create
    with_product do
      @vulnerability = @product.vulnerabilities.create!(vulnerability_params)
      
      if @vulnerability.save
        redirect_to product_path(@product), notice: 'Vulnerability was successfully created.'
      else 
   	    render :new
   	  end
    end
  end

private

  def with_product
    @product = Product.find(params[:product_id])
    yield
  end

  def vulnerability_params
  	params.require(:vulnerability).permit(:id, :product_id, :issue, :severity, :remediation)
  end
end
