class Hero < ApplicationRecord
  has_many :abilities

  def ability_names 
    abilities.pluck(:name).join(', ')
  end
end
