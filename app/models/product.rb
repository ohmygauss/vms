
class Product < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :vulnerabilities
  has_attached_file :document

  validates_attachment_content_type :document, content_type: 'application/pdf' 
end
