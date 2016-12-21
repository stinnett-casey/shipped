class Job < ApplicationRecord
	has_many :boat_jobs
	has_many :boats, through: :boat_jobs
	validates :description, length: {minimum: 50}
	validates_numericality_of :cost, greater_than: 1000
	validates :name, uniqueness: true
	validate :one_of_locations?

	def one_of_locations?
		locations_array = ['Sweden', 'USA', 'China', 'Thailand', 'Norway']
		if !locations_array.include? destination or !locations_array.include? origin
			errors.add(:location, " must be one of the given locations.")
		end
	end
end
