class Boat < ApplicationRecord
	belongs_to :user
	has_many :boat_jobs
	has_many :jobs, through: :boat_jobs

	has_attached_file :avatar, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "missing.png"
	validates_attachment_content_type :avatar, 
	:content_type => /\Aimage\/.*\Z/
	
	validates :name, uniqueness: true
	validate :one_of_locations

	def one_of_locations
		locations_array = ['Sweden', 'USA', 'China', 'Thailand', 'Norway']
		if !locations_array.include? location
			errors.add(:location, " must be one of the given locations.")
		end
	end
end
