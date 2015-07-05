class Sale < ActiveRecord::Base
	validates :client, :product, presence: true
	validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
	
	belongs_to :product
	belongs_to :client
end
