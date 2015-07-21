require 'smarter_csv'

module Importer
  module Portfolio
    extend self

    def run!(file)
      SmarterCSV.process(file).map do |row|
        Product.create({ name: row[:name]}) unless row[:name].blank?
      end
    end  
  end
end