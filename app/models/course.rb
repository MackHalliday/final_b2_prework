class Course < ApplicationRecord
  validates_presence_of :grade, :name
end
