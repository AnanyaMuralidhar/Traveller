class Company < ApplicationRecord
  has_many :trippackages
  has_many :feedbacks
end
