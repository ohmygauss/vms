require 'rails_helper'

describe Importer::Portfolio do
  let(:csv)   { [{ name: 'P1' }, { name: 'P2' }] }
  let(:file)  { 'dummy.txt'                      }

  it 'should import a set of products from a CSV file' do
    allow(SmarterCSV).to receive(:process).with(file).and_return(csv)
    Importer::Portfolio.run!(file)

    expect(Product.pluck(:name)).to eq([ 'P1', 'P2'])
  end
end

describe Importer::Nessus do
  let(:file) { 'spec/resources/nessus.csv' }

  it 'should create a set of product vulnerabilities from a Nessus csv export' do
    product = create(:product)
    Importer::Nessus.run!(file, product)

    expect(product.vulnerabilities.map(&:issue)).to eq([
      'HTTP Server Type and Version 1',
      'HTTP Server Type and Version 2'
    ])
  end
end