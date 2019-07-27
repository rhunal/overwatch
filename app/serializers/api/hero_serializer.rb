class Api::HeroSerializer < Api::BaseSerializer
  attributes  :id, :name, :real_name, :health, :armour, :shield
end
