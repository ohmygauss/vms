class VulnerabilitiesController < ApplicationController
  def new 
    @product       = Product.find(params[:product_id])
  	@vulnerability = Vulnerability.new
  end

  def resolve
    with_known_vulnerability do
      @product = Product.find(params[:product_id])
      @vulnerability.resolve!

      redirect_to product_path(@product), notice: 'Vulnerability was successfully resolved'
    end
  end

  def create
    @product       = Product.find(params[:product_id])
    @vulnerability = @product.vulnerabilities.create!(vulnerability_params)

    respond_to do |format|
      if @vulnerability.save
        format.html { redirect_to product_path(@product), notice: 'Vulnerability was successfully created.' }
        format.json { render :show, status: :ok, location: @vulnerability }
      else 
   	    format.html { render :new }
   	    format.json { render json: @vulnerability.errors, status: :unprocessable_entity}
   	  end
    end
  end

 
private

  def with_known_vulnerability
    @vulnerability = Vulnerability.find(params[:id])
    yield if block_given?
  end

  def vulnerability_params
  	params.require(:vulnerability).permit(:id, :product_id, :issue, :severity, :remediation)
  end
end
