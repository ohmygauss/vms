require_relative '../../lib/product_importer'

describe ProductImporter do
  let(:csv)   { [{ name: 'P1' }, { name: 'P2' }] }
  let(:file)  { 'dummy.txt'                      }

  it 'should import a set of products from a CSV file' do
    allow(SmarterCSV).to receive(:process).with(file).and_return(csv)
    ProductImporter.run!(file)

    expect(Product.pluck(:name)).to eq([ 'P1', 'P2'])
  end
end