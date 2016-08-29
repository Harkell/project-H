class Position < ActiveRecord::Base
	has_one :rationale

	validates :ticker, 
		:presence => true

	validates :name, 
		:presence => true

	validates :amount,
		:presence => true

	validates :description,
		:presence => true

end
