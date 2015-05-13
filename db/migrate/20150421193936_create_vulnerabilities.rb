class CreateVulnerabilities < ActiveRecord::Migration
  def change
    create_table :vulnerabilities do |t|
      t.text :issue
      t.string :severity
      t.text :remediation
      

      t.timestamps null: false
    end
  end
end
