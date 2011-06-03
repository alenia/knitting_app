class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :current_row, :only_integer => true
end
