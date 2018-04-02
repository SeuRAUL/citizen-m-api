class MutationFlag < ApplicationRecord
    belongs_to :citizen, optional: true
end
