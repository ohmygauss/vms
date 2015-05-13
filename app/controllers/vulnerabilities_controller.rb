class VulnerabilitiesController < ApplicationController
 before_action :set_vulnerability, only: [:show, :edit, :update, :destroy]

 def new 
 	@vulnerability = Vulnerability.new(vulnerability_params)
 end

 def edit
 end

 def show
 	@vulnerability = Vulnerability.new
 end

 def index
 	@vulnerability = Vulnerability.all
 end

 def destroy
 	@vulnerability.destroy
 end

 def update
 	respond_to do |format|
	  if @vulnerability.update(vulnerability_params)
 	    format.html { redirect_to product_vulnerability_path, notice: 'Vulnerability was successfully updated.' }
 		format.json { render :show, status: :ok, location: @vulnerability }
 	  else 
 		format.html { render :edit }
 		format.json { render json: @vulnerability.errors, status: :unprocessable_entity }
 	  end
 	end
 end

 def create
   @product = Product.find(params[:product_id])
   @vulnerability = @product.vulnerabilities.create! vulnerability_params
   respond_to do |format|
     if @vulnerability.save
       format.html { redirect_to @vulnerability, notice: 'Vulnerability was successfully created.' }
       format.json { render :show, status: :ok, location: @vulnerability }
     else 
   	   format.html { render :new }
   	   format.json { render json: @vulnerability.errors, status: :unprocessable_entity}
   	 end
   end
   redirect_to @product
 end

 
private
  def vulnerability_params
  	params.require(:vulnerability).permit(:id, :product_id, :issue, :severity, :remediation)
  end

  def set_vulnerability
  	@vulnerability = Vulnerability.find(params[:id])
  end
end
