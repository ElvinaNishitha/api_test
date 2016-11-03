class User < ActiveRecord::Base
	validates_presence_of :name, :age, :role,:gender

	has_and_belongs_to_many :movies
end
