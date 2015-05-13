class AddReportToProduct < ActiveRecord::Migration
  
  def self.up
  	add_attachment :products, :document
  end

  def self.down
  	remove_attachment :products, :document
  end
  
  #def change
  #  add_column :products, :document, :string
  #end
end
