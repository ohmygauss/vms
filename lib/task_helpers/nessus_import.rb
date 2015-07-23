module TaskHelpers
  module NessusImport
    extend self

    def interface(file)
      puts "[+] Importing vulnerability report from #{file}"
      puts '[+] Is this for an existing product? (Y/N)'
      choice = STDIN.gets.chomp

      product = 
        case choice
        when 'Y'
          find_existing_product
        when 'N'
          create_new_product
        else 
          start_again(file)
        end

      puts '[+] Running vulnerability import...'
      Importer::Nessus.run!(file, product)
      puts '[+] Done'
    end

    private

    def find_existing_product
      puts '[+] Enter product name or ID'
      ref = STDIN.gets.chomp

      product = Product.find_by(id: ref) || Product.find_by(name: ref)
      product || (raise ArgumentError, 'Product not found')
    end

    def create_new_product
      puts '[+] Enter product name:'
      name = STDIN.gets.chomp

      Product.create({ name: name })
    end

    def start_again
      puts '[-] Invalid response. Starting over...'
      interface(file)
    end
  end
end