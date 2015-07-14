namespace :import do
  DEFAULT_FILE = 'resources/portfolio.csv'

  desc 'Import products from a CSV file'
  task :products, [:filepath] => :environment do |_, args|
    filepath = args[:filepath] || DEFAULT_FILE

    raise ArgumentError, "File not found at #{filepath}" unless File.exists?(filepath)
    ProductImporter.run!(filepath)
  end
end

