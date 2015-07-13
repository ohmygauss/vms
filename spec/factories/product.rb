PRODUCTS = [
  'Apply for an Employment Tribunal',
  'Civil Claims: Accelerated Claims ',
  'Court and Tribunal Finder',
  'Fee Remission',
  'Tribunals Database',
  'Tribunals Database: UTIAC',
  'Exemplar Court: Online plea',
  'Jury Summonsing',
  'Victim Information Service',
  'Digital Workplace: Information & Publishing',
  'Digital Workplace: People Finder',
  'Digital Workplace: SCS performance assessment',
  'PQ Correspondence',
  'Civil Legal Advice: Operator & Legal Specialists',
  'Civil Legal Advice: Public facing application',
  'Defence Solicitor Call Centre (DSCC)',
  'LAA Crime Billing Online',
  'Money to Prisoners',
  'Prison Visit Booking',
  'Digital Deputyships',
  'Lasting Power of Attorney',
  'Sirius',
  'MOJ Digital Monitoring',
  'Find a Soldiers Will'
]

FactoryGirl.define do
  
  factory :product do
    name  { PRODUCTS.shuffle.first }
  end
end