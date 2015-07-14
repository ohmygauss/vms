require 'rails_helper'

describe 'Products Feature', type: :feature do
  before(:each) do
    create(:product, name: 'Test 1')
    visit '/'
  end

  describe 'Viewing products' do
    it 'displays a list of products on the homepage' do
      expect(page).to have_content 'Listing Products'
      expect(page).to have_content 'Test 1'
    end
  end

  describe 'Adding products' do
    it 'allows products to be added via a form' do
      click_link 'New Product'
      fill_in 'Name', with: 'Test 2'
      click_on 'Create Product'

      expect(page).to have_content 'Product was successfully created'
      expect(page).to have_content 'Test 2'
    end
  end

  describe 'Modifying products' do
    it 'allows products to be modified' do
      click_on 'Edit'
      fill_in 'Name', with: 'Modified 1'
      click_on 'Update Product'

      expect(page).to have_content 'Product was successfully updated'
      expect(page).to have_content 'Modified 1'
    end
  end

  describe 'Deleting products' do
    it 'allows products to be deleted' do
      click_on 'Destroy'

      expect(page).to have_content 'Product was successfully destroyed.'
      expect(page).not_to have_content 'Test 1'
    end
  end
end