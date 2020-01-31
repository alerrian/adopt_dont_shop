class Pet < ApplicationRecord
  validates_presence_of :image,
                        :name,
                        :description,
                        :age,
                        :sex,
                        :status,
                        :shelter_id

  belongs_to :shelter
end
