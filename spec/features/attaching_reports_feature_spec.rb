require 'rails_helper'

describe 'Attaching Reports Feature', type: :feature do
  let(:sample_pdf)     { 'spec/resources/report-sample.pdf' }
  let(:malicious_file) { 'spec/resources/calc.exe'          }

  before(:each) do
    create(:product, name: 'My product')
  end

  def upload_file(path)
    visit '/'
    click_on 'Details'
    attach_file 'product[document]', Rails.root.join(path)
    click_on 'Update report'
  end

  describe 'with valid a report' do
    it 'allows a report to be attached to a product' do
      upload_file(sample_pdf)

      expect(page).to have_content 'Product was successfully updated'
      expect(page).to have_css('a', text: 'Download')
    end

    it 'allows a report to be viewed' do
      upload_file(sample_pdf)
      click_on 'Download'

      expect(page.response_headers['Content-Type']).to eq 'application/pdf'
    end
  end

  describe 'with an invalid report' do
    it 'displays an error and does not attach the report' do
      upload_file(malicious_file)

      expect(page).not_to have_content 'Product was successfully updated'
      expect(page).not_to have_css('a', text: 'Download')
    end
  end
end