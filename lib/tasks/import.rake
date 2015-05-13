require 'smarter_csv'

filename = '/Users/ahanadatta/Downloads/portfolio.csv'



task :csv_product_import => :environment do
  
  rows = SmarterCSV.process(filename)
  rows.each do |row|
  	p = Product.create!({
  		:name => row[:name]
  		}) unless row[:name].blank?
  end


  #  names = []
  #  portfolio = SmarterCSV.process(filename) 
  #  names = portfolio.map { |portfolio| portfolio[:name] }
   
end