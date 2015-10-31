class Day < ActiveRecord::Base
	has_many :sales
	accepts_nested_attributes_for :sales
	validates_presence_of :fecha
end
