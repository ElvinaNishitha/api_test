class Movie < ActiveRecord::Base

	has_and_belongs_to_many :users

	validates_presence_of :title, :year, :rating, :language
	validates :title, length: {minimum: 2}
	validates :rating, length: {minimum:1, maximum: 10}
	# validates :actors, uniqueness: { scope: :name, message: "Actor should be an existing user"}
	# validates :director, uniqueness: { scope: :name, message: "director should be an existing user"}
	# validates :producer, uniqueness: { scope: :name, message: "producer should be an existing user"}

end
