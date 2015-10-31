class Sale < ActiveRecord::Base
	belongs_to :day
	belongs_to :container
	validates_presence_of :hora, :container_id, :cantidad, :precio, :envio
end
