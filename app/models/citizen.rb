class Citizen < ApplicationRecord
    has_many :mutation_flags
    
    accepts_nested_attributes_for :mutation_flags
end
