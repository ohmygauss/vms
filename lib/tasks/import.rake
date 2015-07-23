namespace :import do
  DEFAULT_PORTFOLIO = 'resources/portfolio.csv'

  desc 'Import products from a CSV portfolio file'
  task :portfolio, [:filepath] => :environment do |_, args|
    filepath = args[:filepath] || DEFAULT_PORTFOLIO

    raise ArgumentError, "File not found at #{filepath}" unless File.exists?(filepath)
    Importer::Portfolio.run!(filepath)
  end

  desc 'Import nessus scan results for a product'
  task :nessus, [:filepath] => :environment do |_, args|
    TaskHelpers::NessusImport.interface(args[:filepath])
  end
end

