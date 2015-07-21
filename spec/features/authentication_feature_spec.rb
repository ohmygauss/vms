require 'rails_helper'

describe 'Authentication Feature', type: :feature do
  describe 'When the user is not authorized' do
    it 'should receive a 401 error' do
      visit '/'
      
      expect(page.status_code).to eq 401
      expect(page).to have_content 'HTTP Basic: Access denied'
    end
  end

  describe 'When the user is authorized' do
    it 'should be able to view the page' do
      http_login
      visit '/'

      expect(page.status_code).to eq 200
      expect(page).to have_content 'Listing Products'
    end
  end
end