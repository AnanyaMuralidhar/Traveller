class Trippackage < ApplicationRecord
  has_many :slots
  belongs_to :company
end
