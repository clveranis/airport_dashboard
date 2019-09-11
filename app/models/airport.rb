class Airport < ApplicationRecord
  validates :iata_code, presence: true

  def self.update_or_create_by(args, attributes)
    obj = self.find_or_create_by(args)
    obj.update(attributes)
    return obj
  end
  
  
end
