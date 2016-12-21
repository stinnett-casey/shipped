class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boats

  def full_name
		if !first_name.nil? && !last_name.nil?
			first_name + " " + last_name
		elsif !first_name.nil?
			first_name
		elsif !last_name.nil?
			last_name
		else
			"(No Name)"
		end
	end
end
