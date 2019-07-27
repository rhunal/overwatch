class Api::AbilitySerializer < Api::BaseSerializer
  attributes  :id, :name, :description, :is_ultimate, :hero_id
end
