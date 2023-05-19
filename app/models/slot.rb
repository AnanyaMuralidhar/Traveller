class Slot < ApplicationRecord
  belongs_to :user
  belongs_to :trippackage
end
