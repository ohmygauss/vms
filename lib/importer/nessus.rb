require 'smarter_csv'

module Importer
  module Nessus
    extend self

    KEY_MAPPINGS = {
      issue:       :name,
      severity:    :risk,
      remediation: :solution
    }

    def run!(file, product)
      product.vulnerabilities.concat(
        parse_nessus_data(file).map { |attributes| Vulnerability.create(attributes) } 
      )
    end

    private

    def parse_nessus_data(file)
      SmarterCSV.process(file).map do |raw_h| 
        vuln_params(raw_h)
      end
    end

    def vuln_params(nessus_h) 
      KEY_MAPPINGS.inject({}) do |result, (attribute, nessus_key)|
        result.merge({ attribute => nessus_h[nessus_key] })
      end
    end
  end
end